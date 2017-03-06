open Ctypes
open Foundation
open CoreGraphics
open Cocoa
open Metal
open MetalKit

type vertex
let vertex : vertex structure typ = structure "Vertex"
let p0 = field vertex "x" float
let p1 = field vertex "y" float
let p2 = field vertex "z" float
let p3 = field vertex "w" float
let c0 = field vertex "r" float
let c1 = field vertex "g" float
let c2 = field vertex "b" float
let c3 = field vertex "a" float
let () = seal vertex

let vertices =
  let vertex0 = make vertex in
  setf vertex0 p0 0.0;
  setf vertex0 p1 0.5;
  setf vertex0 p2 0.0;
  setf vertex0 p3 1.0;
  setf vertex0 c0 1.0;
  setf vertex0 c1 0.0;
  setf vertex0 c2 0.0;
  setf vertex0 c3 1.0;
  let vertex1 = make vertex in
  setf vertex1 p0 (-0.5);
  setf vertex1 p1 (-0.5);
  setf vertex1 p2 0.0;
  setf vertex1 p3 1.0;
  setf vertex1 c0 0.0;
  setf vertex1 c1 1.0;
  setf vertex1 c2 0.0;
  setf vertex1 c3 1.0;
  let vertex2 = make vertex in
  setf vertex2 p0 0.5;
  setf vertex2 p1 (-0.5);
  setf vertex2 p2 0.0;
  setf vertex2 p3 1.0;
  setf vertex2 c0 0.0;
  setf vertex2 c1 0.0;
  setf vertex2 c2 1.0;
  setf vertex2 c3 1.0;
  let result = allocate_n vertex ~count:3 in
  (result +@ 0) <-@ vertex0;
  (result +@ 1) <-@ vertex1;
  (result +@ 2) <-@ vertex2;
  result

let device = Metal.create_system_default_device ()

let clear_color = MTLClearColor.make 1.0 0.3 0.3 1.0
let content_rect = CGRect.make (CGPoint.make 100.0 300.0) (CGSize.make 600.0 600.0)

let draw_rect (self : ObjC.id) (_ : ObjC.selector) (_ : CGRect.t) =
  let view = new MTKView.t self in
  let buffer = new MTLBuffer.t (ObjC.get_obj_ivar view "buffer") in
  let command_queue = new MTLCommandQueue.t (ObjC.get_obj_ivar view "command_queue") in
  let pipeline_state = new MTLRenderPipelineState.t (ObjC.get_obj_ivar view "pipeline_state") in
  let command_buffer = command_queue#command_buffer in
  let command_encoder = command_buffer#render_command_encoder_with_descriptor view#current_render_pass_descriptor in
  command_encoder#set_render_pipeline_state pipeline_state;
  command_encoder#set_vertex_buffer_offset_at_index buffer (Ctypes.Uintptr.of_int 0) (Ctypes.Uintptr.of_int 0);
  command_encoder#draw_primitives_vertex_start_vertex_count 3 (Ctypes.Uintptr.of_int 0) (Ctypes.Uintptr.of_int 3);
  command_encoder#end_encoding;
  command_buffer#present_drawable view#current_drawable;
  command_buffer#commit

let window_delegate =
  let window_delegate_class = ObjC.allocate_class NSObject.klass "OCWindowDelegate" 0 in
  let window_will_close (_ : ObjC.id) (_ : ObjC.selector) (_ : ObjC.id) = (NSApplication.shared_application ())#terminate (NSObject.nil ()) in
  let _ = ObjC.add_method window_delegate_class "windowWillClose:" window_will_close (ObjC.id @-> ObjC.selector @-> ObjC.id @-> returning void) "v@:@" in
  ObjC.register_class window_delegate_class;
  new NSWindowDelegate.t (ObjC.alloc window_delegate_class)

let view =
  let view_class = ObjC.allocate_class MTKView.klass "OCView" 0 in
  let _ = ObjC.add_ivar view_class "command_queue" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "buffer" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "pipeline_state" 8 3 "@" in
  let _ = ObjC.add_method view_class "drawRect:" draw_rect (ObjC.id @-> ObjC.selector @-> CGRect.t @-> returning void) "v@:{CGRect={CGPoint=dd}{CGSize=dd}}" in
  ObjC.register_class view_class;
  let result = (new MTKView.t (ObjC.alloc view_class))#init_with_frame_device content_rect device in
  let buffer = device#new_buffer_with_bytes_length_options (to_voidp vertices) (Ctypes.Uintptr.of_int 96) 0 in
  let command_queue = device#new_command_queue#retain in
  let error = allocate ObjC.id ObjC.nil in
  let library = device#new_library_with_file_error (NSString.new_with_utf8_string "../../metal-rs/src/examples/example-02.metallib") error in
  let pipeline_descriptor = (MTLRenderPipelineDescriptor.alloc ())#init in
  pipeline_descriptor#set_vertex_function (library#new_function_with_name (NSString.new_with_utf8_string "vertex_main"));
  pipeline_descriptor#set_fragment_function (library#new_function_with_name (NSString.new_with_utf8_string "fragment_main"));
  let color_attachments = pipeline_descriptor#color_attachments in
  let color_attachment = color_attachments#object_at_indexed_subscript (Ctypes.Uintptr.of_int 0) in
  color_attachment#set_pixel_format 80;
  let pipeline_state = device#new_render_pipeline_state_with_descriptor_error pipeline_descriptor error in
  ObjC.set_ivar result#get_id "buffer" (to_voidp buffer#get_id);
  ObjC.set_ivar result#get_id "command_queue" (to_voidp command_queue#get_id);
  ObjC.set_ivar result#get_id "pipeline_state" (to_voidp pipeline_state#get_id);
  result#set_color_pixel_format(80);
  result#set_clear_color(clear_color);
  result

let window =
  let result = NSWindow.new_with_content_rect_style_mask_backing_defer content_rect (Ctypes.Uintptr.of_int 7) (Ctypes.Uintptr.of_int 2) false in
  result#make_key_and_order_front (NSObject.nil ());
  result#set_title (NSString.new_with_utf8_string "Cocoa + OCaml = 🍪");
  result#set_delegate window_delegate;
  result#set_content_view (view :> NSView.t);
  result

let () = (NSApplication.shared_application ())#run
