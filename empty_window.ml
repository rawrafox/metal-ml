open Ctypes
open Foundation
open CoreGraphics
open Cocoa

let content_rect = CGRect.make (CGPoint.make 100.0 300.0) (CGSize.make 600.0 600.0)

let window_delegate =
  let window_delegate_class = ObjC.allocate_class NSObject.klass "OCWindowDelegate" 0 in
  let window_will_close (_ : ObjC.id) (_ : ObjC.selector) (_ : ObjC.id) = (NSApplication.shared_application ())#terminate (NSObject.nil ()) in
  let _ = ObjC.add_method window_delegate_class "windowWillClose:" window_will_close "v@:@" in
  ObjC.register_class window_delegate_class;
  new NSWindowDelegate.t (ObjC.alloc window_delegate_class)

let window =
  let result = NSWindow.new_with_content_rect_style_mask_backing_defer content_rect (Ctypes.Uintptr.of_int 7) (Ctypes.Uintptr.of_int 2) false in
  result#make_key_and_order_front (NSObject.nil ());
  result#set_title (NSString.new_with_utf8_string "Cocoa + OCaml = 🍪");
  result#set_delegate window_delegate;
  result

let () = (NSApplication.shared_application ())#run
