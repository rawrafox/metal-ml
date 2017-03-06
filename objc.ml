open Ctypes
open Foreign

type selector = unit ptr
let selector  : selector typ = ptr void

let register_name = foreign "sel_registerName" (string @-> returning selector)

type id = unit ptr
let id : id typ = ptr void
let nil = null

let message_send selector_name prototype =
  let sel = register_name selector_name in
  let fn = foreign "objc_msgSend" (id @-> selector @-> prototype) in
  (Core_kernel.Fn.flip fn) sel

let implementation = funptr (id @-> selector @-> returning void)

let get_class = foreign "objc_getClass" (string @-> returning id)
let get_protocol = foreign "objc_getProtocol" (string @-> returning id)
let allocate_class = foreign "objc_allocateClassPair" (id @-> string @-> int @-> returning id)
let register_class = foreign "objc_registerClassPair" (id @-> returning void)

let add_ivar = foreign "class_addIvar" (id @-> string @-> int @-> int @-> string @-> returning void)
let add_method_ffi = foreign "class_addMethod" (id @-> selector @-> implementation @-> string @-> returning bool)
let add_method klass op imp signature encoded_signature = add_method_ffi klass (register_name op) (coerce (Foreign.funptr signature) implementation imp) encoded_signature

let get_ivar_ffi = foreign "object_getInstanceVariable" (id @-> string @-> ptr void @-> returning void)
let get_ivar self name t v =
  let rv = allocate t v in
  get_ivar_ffi self#get_id name (to_voidp rv);
  !@ rv

let get_obj_ivar self name =
  get_ivar self name id nil

let set_ivar = foreign "object_setInstanceVariable" (id @-> string @-> ptr void @-> returning void)

let alloc = message_send "alloc" (returning id)
let retain = message_send "retain" (returning id)
let release = message_send "release" (returning void)
let retain_count = message_send "retainCount" (returning long)

module Object = struct
  class t (ptr : id) = object (self)
    val ptr = ptr

    method get_id = ptr
    
    method retain =
      let _ = retain ptr in
      self

    method release = release ptr

    method retain_count = retain_count ptr
  end
end
