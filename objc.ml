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
let add_method = foreign "class_addMethod" (id @-> selector @-> implementation @-> string @-> returning bool)

let get_ivar = foreign "object_getInstanceVariable" (id @-> string @-> ptr void @-> returning void)
let set_ivar = foreign "object_setInstanceVariable" (id @-> string @-> ptr void @-> returning void)