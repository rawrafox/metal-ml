open Ctypes
open Foreign
open Objc

let alloc = message_send "alloc" (returning id)
let init = message_send "init" (returning id)

(* Start NSObject *)
let class_ns_object = get_class "NSObject"

(* Identifying Classes *)
let sel_class = register_name "class"
let sel_superclass = register_name "superclass"

(* Identifying and Comparing Objects *)
let sel_is_equal = register_name "isEqual:"
let sel_hash = register_name "hash"
let sel_self = register_name "self"

(* Testing Object Inheritance, Behavior, and Conformance *)
let sel_is_kind_of_class = register_name "isKindOfClass:"
let sel_is_memeber_of_class = register_name "isMemberOfClass:"
let sel_responds_to_selector = register_name "respondsToSelector:"
let sel_conforms_to_protocol = register_name "conformsToProtocol:"

(* Describing Objects *)
let description = message_send "description" (returning id)
let debug_description = message_send "debugDescription" (returning id)

(* Describing Objects *)
let sel_perform_selector = register_name "performSelector:"
let sel_perform_selector_with_object = register_name "performSelector:withObject:"
let sel_perform_selector_with_object_with_object = register_name "performSelector:withObject:withObject:"

(* Identifying Proxies *)
let sel_is_proxy = register_name "isProxy"

(* Obsolete Methods *)
let retain = message_send "retain" (returning id)
let release = message_send "release" (returning void)
let autorelease = message_send "autorelease" (returning id)
let retain_count = message_send "retainCount" (returning int)
let sel_zone = register_name "zone"
(* End NSObject *)

(* Start NSString *)
let class_ns_string = get_class "NSString"

let utf8_string = message_send "UTF8String" (returning string)

let init_with_utf8_string = message_send "initWithUTF8String:" (string @-> returning id)
(* End NSString *)

(* Start NSArray *)
let class_ns_array = get_class "NSArray"
(* End NSString *)

class ns_object (ptr:id) = object (self)
  val ptr = ptr

  method get_id = ptr

  method retain =
    let _ = retain ptr in
    self

  method release = release ptr
  method retain_count = retain_count ptr

  method description = new ns_string (description ptr)
  method debug_description = new ns_string (debug_description ptr)
end and ns_array (ptr : id) = object (self)
  inherit ns_object ptr as super
end and ns_string (ptr:id) = object (self)
  inherit ns_object ptr as super

  method init_with_utf8_string s = new ns_string (init_with_utf8_string ptr s)

  method utf8_string = utf8_string ptr
end

let ns_object_alloc () = new ns_object (alloc class_ns_object)
let ns_array_alloc () = new ns_array (alloc class_ns_array)
let ns_string_alloc () = new ns_string (alloc class_ns_string)

let ns_object_nil = new ns_object nil

let ns_string_from_string s = (ns_string_alloc ())#init_with_utf8_string s
