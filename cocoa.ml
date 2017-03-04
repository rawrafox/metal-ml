open Ctypes
open Foreign
open Objc
open Foundation

type cg_point
let cg_point  :  cg_point structure typ = structure "CGPoint"
let x = field cg_point "x" double
let y = field cg_point "y" double
let () = seal cg_point

type cg_size
let cg_size  :  cg_size structure typ = structure "CGSize"
let width = field cg_size "width" double
let height = field cg_size "height" double
let () = seal cg_size

type cg_rect
let cg_rect  :  cg_rect structure typ = structure "CGRect"
let origin = field cg_rect "origin" cg_point
let size = field cg_rect "size" cg_size
let () = seal cg_rect

let sel_alloc = register_name "alloc"

(* Start NSApplication *)
let class_ns_application = get_class "NSApplication"

let shared_application = message_send "sharedApplication" (returning id)
let run = message_send "run" (returning void)
let terminate = message_send "terminate:" (id @-> returning void)

(* End NSWindow *)

class ns_application (ptr : id) = object (self)
  inherit ns_object ptr as super

  method run = run ptr
  method terminate (sender : ns_object) = terminate ptr sender#get_id
end

let ns_application_shared_application () = new ns_application (shared_application class_ns_application)

class ns_view (ptr : id) = object (self)
  inherit ns_object ptr as super
end

(* Start NSWindow *)
let class_ns_window = get_class "NSWindow"

(* Creating Windows *)
let init_with_content_rect_style_mask_backing_defer = message_send "initWithContentRect:styleMask:backing:defer:" (cg_rect @-> int @-> int @-> bool @-> returning id)

let make_key_and_order_front = message_send "makeKeyAndOrderFront:" (id @-> returning void)

let set_content_view = message_send "setContentView:" (id @-> returning void)
let set_title = message_send "setTitle:" (id @-> returning void)
let set_delegate = message_send "setDelegate:" (id @-> returning void)

(* End NSWindow *)

class ns_window (ptr : id) = object (self)
  inherit ns_object ptr as super

  method init_with_content_rect_style_mask_backing_defer contentRect style bufferingType flag = new ns_window (init_with_content_rect_style_mask_backing_defer ptr contentRect style bufferingType flag)

  method make_key_and_order_front (sender : ns_object) = make_key_and_order_front ptr sender#get_id

  method set_content_view (view : ns_view) = set_content_view ptr view#get_id
  method set_title (title : ns_string) = set_title ptr title#get_id
  method set_delegate (delegate : ns_object) = set_delegate ptr delegate#get_id
end

let ns_window_alloc () = new ns_window (alloc class_ns_window)
