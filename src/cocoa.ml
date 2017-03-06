open Ctypes
open CoreGraphics
open CoreGraphics.Implementation
open CoreGraphics.Implementation.Extern
open Foundation
open Foundation.Implementation
open Foundation.Implementation.Extern

module Implementation = struct
  module Extern = struct
    type ns_rect = cg_rect
    let ns_rect = cg_rect

    let ns_application_class = ObjC.get_class "NSApplication"
    let ns_application_shared_application = ObjC.message_send "sharedApplication" (returning ObjC.id)
    let ns_application_run = ObjC.message_send "run" (returning void)
    let ns_application_terminate = ObjC.message_send "terminate:" (ObjC.id @-> returning void)

    let ns_view_class = ObjC.get_class "NSView"
    let ns_view_get_frame = ObjC.message_send "frame" (returning ns_rect)
    let ns_view_set_frame = ObjC.message_send "setFrame:" (ns_rect @-> returning void)

    let ns_window_class = ObjC.get_class "NSWindow"
    let ns_window_init_with_content_rect_style_mask_backing_defer = ObjC.message_send "initWithContentRect:styleMask:backing:defer:" (ns_rect @-> uintptr_t @-> uintptr_t @-> bool @-> returning ObjC.id)
    let ns_window_make_key_and_order_front = ObjC.message_send "makeKeyAndOrderFront:" (ObjC.id @-> returning void)
    let ns_window_get_content_view = ObjC.message_send "contentView" (returning ObjC.id)
    let ns_window_set_content_view = ObjC.message_send "setContentView:" (ObjC.id @-> returning void)
    let ns_window_get_delegate = ObjC.message_send "delegate" (returning ObjC.id)
    let ns_window_set_delegate = ObjC.message_send "setDelegate:" (ObjC.id @-> returning void)
    let ns_window_get_title = ObjC.message_send "title" (returning ObjC.id)
    let ns_window_set_title = ObjC.message_send "setTitle:" (ObjC.id @-> returning void)
  end

  open Extern

  class ns_application (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method run = ns_application_run ptr
    method terminate (sender : ns_object) = ns_application_terminate ptr sender#get_id
  end and ns_view (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method frame = ns_view_get_frame ptr
    method set_frame value = ns_view_set_frame ptr value
  end and ns_window (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init_with_content_rect_style_mask_backing_defer content_rect style buffering_type flag = new ns_window (ns_window_init_with_content_rect_style_mask_backing_defer ptr content_rect style buffering_type flag)
    method make_key_and_order_front (sender : ns_object) = ns_window_make_key_and_order_front ptr sender#get_id
    method content_view = new ns_view (ns_window_get_content_view ptr)
    method set_content_view (value : ns_view) = ns_window_set_content_view ptr value#get_id
    method delegate = new ns_window_delegate (ns_window_get_delegate ptr)
    method set_delegate (value : ns_window_delegate) = ns_window_set_delegate ptr value#get_id
    method title = new ns_string (ns_window_get_title ptr)
    method set_title (value : ns_string) = ns_window_set_title ptr value#get_id
  end and ns_window_delegate (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end
end

open Implementation
open Implementation.Extern

module NSRect = struct
  let t = ns_rect
end

module NSApplication = struct
  class t = Implementation.ns_application
  let klass = ns_application_class

  let alloc () = new t (ObjC.alloc ns_application_class)
  let nil () = new t (ObjC.nil)
  let shared_application () = new t (ns_application_shared_application ns_application_class)
end

module NSView = struct
  class t = Implementation.ns_view
  let klass = ns_view_class

  let alloc () = new t (ObjC.alloc ns_view_class)
  let nil () = new t (ObjC.nil)
end

module NSWindow = struct
  class t = Implementation.ns_window
  let klass = ns_window_class

  let alloc () = new t (ObjC.alloc ns_window_class)
  let nil () = new t (ObjC.nil)

  let new_with_content_rect_style_mask_backing_defer content_rect style buffering_type flag = (alloc ())#init_with_content_rect_style_mask_backing_defer content_rect style buffering_type flag
end

module NSWindowDelegate = struct
  class t = Implementation.ns_window_delegate
end
