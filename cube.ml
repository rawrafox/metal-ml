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

let make_vertex p0_v p1_v p2_v p3_v c0_v c1_v c2_v c3_v =
  let result = make vertex in
  setf result p0 p0_v;
  setf result p1 p1_v;
  setf result p2 p2_v;
  setf result p3 p3_v;
  setf result c0 c0_v;
  setf result c1 c1_v;
  setf result c2 c2_v;
  setf result c3 c3_v;
  result

let vertices =
  let vertex0 = make_vertex (-1.0) ( 1.0) ( 1.0) 1.0 0.0 1.0 1.0 1.0 in
  let vertex1 = make_vertex (-1.0) (-1.0) ( 1.0) 1.0 0.0 0.0 1.0 1.0 in
  let vertex2 = make_vertex ( 1.0) (-1.0) ( 1.0) 1.0 1.0 0.0 1.0 1.0 in
  let vertex3 = make_vertex ( 1.0) ( 1.0) ( 1.0) 1.0 1.0 1.0 1.0 1.0 in
  let vertex4 = make_vertex (-1.0) ( 1.0) (-1.0) 1.0 0.0 1.0 0.0 1.0 in
  let vertex5 = make_vertex (-1.0) (-1.0) (-1.0) 1.0 0.0 0.0 0.0 1.0 in
  let vertex6 = make_vertex ( 1.0) (-1.0) (-1.0) 1.0 1.0 0.0 0.0 1.0 in
  let vertex7 = make_vertex ( 1.0) ( 1.0) (-1.0) 1.0 1.0 1.0 0.0 1.0 in
  let result = allocate_n vertex ~count:8 in
  (result +@ 0) <-@ vertex0;
  (result +@ 1) <-@ vertex1;
  (result +@ 2) <-@ vertex2;
  (result +@ 3) <-@ vertex3;
  (result +@ 4) <-@ vertex4;
  (result +@ 5) <-@ vertex5;
  (result +@ 6) <-@ vertex6;
  (result +@ 7) <-@ vertex7;
  result

let indices =
  let result = allocate_n int16_t ~count:36 in
  (result +@  0) <-@ 3;
  (result +@  1) <-@ 2;
  (result +@  2) <-@ 6;
  (result +@  3) <-@ 6;
  (result +@  4) <-@ 7;
  (result +@  5) <-@ 3;
  (result +@  6) <-@ 4;
  (result +@  7) <-@ 5;
  (result +@  8) <-@ 1;
  (result +@  9) <-@ 1;
  (result +@ 10) <-@ 0;
  (result +@ 11) <-@ 4;
  (result +@ 12) <-@ 4;
  (result +@ 13) <-@ 0;
  (result +@ 14) <-@ 3;
  (result +@ 15) <-@ 3;
  (result +@ 16) <-@ 7;
  (result +@ 17) <-@ 4;
  (result +@ 18) <-@ 1;
  (result +@ 19) <-@ 5;
  (result +@ 20) <-@ 6;
  (result +@ 21) <-@ 6;
  (result +@ 22) <-@ 2;
  (result +@ 23) <-@ 1;
  (result +@ 24) <-@ 0;
  (result +@ 25) <-@ 1;
  (result +@ 26) <-@ 2;
  (result +@ 27) <-@ 2;
  (result +@ 28) <-@ 3;
  (result +@ 29) <-@ 0;
  (result +@ 30) <-@ 7;
  (result +@ 31) <-@ 6;
  (result +@ 32) <-@ 5;
  (result +@ 33) <-@ 5;
  (result +@ 34) <-@ 4;
  (result +@ 35) <-@ 7;
  result

let uniform = allocate_n float ~count:16

let device = Metal.create_system_default_device ()

let clear_color = MTLClearColor.make 1.0 0.3 0.3 1.0
let content_rect = CGRect.make (CGPoint.make 100.0 300.0) (CGSize.make 600.0 600.0)

let draw_rect (self : ObjC.id) (_ : ObjC.selector) (_ : CGRect.t) =
  let view = new MTKView.t self in
  let vertex_buffer = new MTLBuffer.t (view#get_object_ivar "vertex_buffer") in
  let index_buffer = new MTLBuffer.t (view#get_object_ivar "index_buffer") in
  let uniform_buffer = new MTLBuffer.t (view#get_object_ivar "uniform_buffer") in
  let command_queue = new MTLCommandQueue.t (view#get_object_ivar "command_queue") in
  let depth_stencil_state = new MTLDepthStencilState.t (view#get_object_ivar "depth_stencil_state") in
  let pipeline_state = new MTLRenderPipelineState.t (view#get_object_ivar "pipeline_state") in
  let command_buffer = command_queue#command_buffer in
  let command_encoder = command_buffer#render_command_encoder_with_descriptor view#current_render_pass_descriptor in
  let seconds = mod_float (Unix.gettimeofday ()) 10000.0 in
  let scale = Matrix.scale (1.0 +. 0.5 *. (sin seconds)) in
  let rotation_x = Matrix.rotateX (seconds *. Matrix.pi /. 2.0) in
  let rotation_y = Matrix.rotateY (seconds *. Matrix.pi /. 3.0) in
  let model_matrix = Matrix.mul scale (Matrix.mul rotation_x rotation_y) in
  let projection_matrix = Matrix.perspective (0.4 *. Matrix.pi) 1.0 1.0 250.0 in
  let view_matrix = Matrix.lookat [|0.0; 0.0; (-200.0)|] [|0.0; 0.0; 0.0|] [|0.0; 1.0; 0.0|] in
  let uniform_matrix = Matrix.mul projection_matrix (Matrix.mul view_matrix model_matrix) in
  let uniform = from_voidp float uniform_buffer#contents in
  (uniform +@  0) <-@ uniform_matrix.(0);
  (uniform +@  1) <-@ uniform_matrix.(1);
  (uniform +@  2) <-@ uniform_matrix.(2);
  (uniform +@  3) <-@ uniform_matrix.(3);
  (uniform +@  4) <-@ uniform_matrix.(4);
  (uniform +@  5) <-@ uniform_matrix.(5);
  (uniform +@  6) <-@ uniform_matrix.(6);
  (uniform +@  7) <-@ uniform_matrix.(7);
  (uniform +@  8) <-@ uniform_matrix.(8);
  (uniform +@  9) <-@ uniform_matrix.(9);
  (uniform +@ 10) <-@ uniform_matrix.(10);
  (uniform +@ 11) <-@ uniform_matrix.(11);
  (uniform +@ 12) <-@ uniform_matrix.(12);
  (uniform +@ 13) <-@ uniform_matrix.(13);
  (uniform +@ 14) <-@ uniform_matrix.(14);
  (uniform +@ 15) <-@ uniform_matrix.(15);
  command_encoder#set_render_pipeline_state pipeline_state;
  command_encoder#set_depth_stencil_state depth_stencil_state;
  command_encoder#set_front_facing_winding 1;
  command_encoder#set_cull_mode 2;
  command_encoder#set_vertex_buffer_offset_at_index vertex_buffer (Ctypes.Uintptr.of_int 0) (Ctypes.Uintptr.of_int 0);
  command_encoder#set_vertex_buffer_offset_at_index uniform_buffer (Ctypes.Uintptr.of_int 0) (Ctypes.Uintptr.of_int 1);
  command_encoder#draw_indexed_primitives_index_count_index_type_index_buffer_index_buffer_offset 3 (Ctypes.Uintptr.of_int 36) 0 index_buffer (Ctypes.Uintptr.of_int 0);
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
  let _ = ObjC.add_ivar view_class "vertex_buffer" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "index_buffer" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "uniform_buffer" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "depth_stencil_state" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "pipeline_state" 8 3 "@" in
  let _ = ObjC.add_method view_class "drawRect:" draw_rect (ObjC.id @-> ObjC.selector @-> CGRect.t @-> returning void) "v@:{CGRect={CGPoint=dd}{CGSize=dd}}" in
  ObjC.register_class view_class;
  let result = (new MTKView.t (ObjC.alloc view_class))#init_with_frame_device content_rect device in
  let vertex_buffer = device#new_buffer_with_bytes_length_options (to_voidp vertices) (Ctypes.Uintptr.of_int 256) 0 in
  let index_buffer = device#new_buffer_with_bytes_length_options (to_voidp indices) (Ctypes.Uintptr.of_int 72) 0 in
  let uniform_buffer = device#new_buffer_with_bytes_length_options (to_voidp vertices) (Ctypes.Uintptr.of_int 64) 16 in
  let command_queue = device#new_command_queue#retain in
  let error = allocate ObjC.id ObjC.nil in
  let library = device#new_library_with_file_error (NSString.new_with_utf8_string "../../metal-rs/src/examples/example-03.metallib") error in
  let depth_stencil_descriptor = MTLDepthStencilDescriptor.depth_stencil_descriptor () in
  depth_stencil_descriptor#set_depth_compare_function 1;
  depth_stencil_descriptor#set_depth_write_enabled true;
  let depth_stencil_state = device#new_depth_stencil_state_with_descriptor depth_stencil_descriptor in
  let pipeline_descriptor = (MTLRenderPipelineDescriptor.alloc ())#init in
  pipeline_descriptor#set_vertex_function (library#new_function_with_name (NSString.new_with_utf8_string "vertex_main"));
  pipeline_descriptor#set_fragment_function (library#new_function_with_name (NSString.new_with_utf8_string "fragment_main"));
  let color_attachments = pipeline_descriptor#color_attachments in
  let color_attachment = color_attachments#object_at_indexed_subscript (Ctypes.Uintptr.of_int 0) in
  color_attachment#set_pixel_format 80;
  let pipeline_state = device#new_render_pipeline_state_with_descriptor_error pipeline_descriptor error in
  result#set_object_ivar "vertex_buffer" (vertex_buffer :> ObjC.Object.t);
  result#set_object_ivar "index_buffer" (index_buffer :> ObjC.Object.t);
  result#set_object_ivar "uniform_buffer" (uniform_buffer :> ObjC.Object.t);
  result#set_object_ivar "command_queue" (command_queue :> ObjC.Object.t);
  result#set_object_ivar "depth_stencil_state" (depth_stencil_state :> ObjC.Object.t);
  result#set_object_ivar "pipeline_state" (pipeline_state :> ObjC.Object.t);
  result#set_color_pixel_format 80;
  result#set_clear_color clear_color;
  result

let window =
  let result = NSWindow.new_with_content_rect_style_mask_backing_defer content_rect (Ctypes.Uintptr.of_int 7) (Ctypes.Uintptr.of_int 2) false in
  result#make_key_and_order_front (NSObject.nil ());
  result#set_title (NSString.new_with_utf8_string "Cocoa + OCaml = 🍪");
  result#set_delegate window_delegate;
  result#set_content_view (view :> NSView.t);
  result

let () = (NSApplication.shared_application ())#run
