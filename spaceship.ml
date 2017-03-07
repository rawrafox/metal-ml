open Ctypes
open Foundation
open CoreGraphics
open Cocoa
open Metal
open MetalKit
open ModelIo

let device = Metal.create_system_default_device ()
let content_rect = CGRect.make (CGPoint.make 100.0 300.0) (CGSize.make 600.0 600.0)

let draw_rect (self : ObjC.id) (_ : ObjC.selector) (_ : CGRect.t) =
  let view = new MTKView.t self in
  let mesh_buffer = new MTKMeshBuffer.t (view#get_object_ivar "mesh_buffer") in
  let submeshes = new NSArray.t (view#get_object_ivar "submeshes") in
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
  let projection_matrix = Matrix.perspective (0.4 *. Matrix.pi) 1.0 1.0 10000.0 in
  let view_matrix = Matrix.lookat [|0.0; 0.0; (-8000.0)|] [|0.0; 0.0; 0.0|] [|0.0; 1.0; 0.0|] in
  let model_view_matrix = (Matrix.mul view_matrix model_matrix) in
  let uniform_matrix = Matrix.mul projection_matrix model_view_matrix in
  let uniform = from_voidp float uniform_buffer#contents in
  (* Model-View-Projection*)
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
  (* Model-View *)
  (uniform +@ 16) <-@ model_view_matrix.(0);
  (uniform +@ 17) <-@ model_view_matrix.(1);
  (uniform +@ 18) <-@ model_view_matrix.(2);
  (uniform +@ 19) <-@ model_view_matrix.(3);
  (uniform +@ 20) <-@ model_view_matrix.(4);
  (uniform +@ 21) <-@ model_view_matrix.(5);
  (uniform +@ 22) <-@ model_view_matrix.(6);
  (uniform +@ 23) <-@ model_view_matrix.(7);
  (uniform +@ 24) <-@ model_view_matrix.(8);
  (uniform +@ 25) <-@ model_view_matrix.(9);
  (uniform +@ 26) <-@ model_view_matrix.(10);
  (uniform +@ 27) <-@ model_view_matrix.(11);
  (uniform +@ 28) <-@ model_view_matrix.(12);
  (uniform +@ 29) <-@ model_view_matrix.(13);
  (uniform +@ 30) <-@ model_view_matrix.(14);
  (uniform +@ 31) <-@ model_view_matrix.(15);
  (* Normal*)
  (uniform +@ 32) <-@ model_view_matrix.(0);
  (uniform +@ 33) <-@ model_view_matrix.(1);
  (uniform +@ 34) <-@ model_view_matrix.(2);
  (uniform +@ 36) <-@ model_view_matrix.(4);
  (uniform +@ 37) <-@ model_view_matrix.(5);
  (uniform +@ 38) <-@ model_view_matrix.(6);
  (uniform +@ 40) <-@ model_view_matrix.(8);
  (uniform +@ 41) <-@ model_view_matrix.(9);
  (uniform +@ 42) <-@ model_view_matrix.(10);

  command_encoder#set_render_pipeline_state pipeline_state;
  command_encoder#set_depth_stencil_state depth_stencil_state;
  command_encoder#set_front_facing_winding 1;
  command_encoder#set_cull_mode 2;
  command_encoder#set_vertex_buffer_offset_at_index mesh_buffer#buffer mesh_buffer#offset (Ctypes.Uintptr.of_int 0);
  command_encoder#set_vertex_buffer_offset_at_index uniform_buffer (Ctypes.Uintptr.of_int 0) (Ctypes.Uintptr.of_int 1);
  for i = 0 to (Ctypes.Uintptr.to_int submeshes#count) - 1 do
    let submesh = new MTKSubmesh.t (submeshes#object_at_index (Ctypes.Uintptr.of_int i))#get_id in
    let index_buffer = submesh#index_buffer in
    command_encoder#draw_indexed_primitives_index_count_index_type_index_buffer_index_buffer_offset submesh#primitive_type submesh#index_count submesh#index_type index_buffer#buffer index_buffer#offset
  done;
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
  let _ = ObjC.add_ivar view_class "mesh_buffer" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "submeshes" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "uniform_buffer" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "depth_stencil_state" 8 3 "@" in
  let _ = ObjC.add_ivar view_class "pipeline_state" 8 3 "@" in
  let _ = ObjC.add_method view_class "drawRect:" draw_rect (ObjC.id @-> ObjC.selector @-> CGRect.t @-> returning void) "v@:{CGRect={CGPoint=dd}{CGSize=dd}}" in
  ObjC.register_class view_class;
  let result = (new MTKView.t (ObjC.alloc view_class))#init_with_frame_device content_rect device in
  let asset = MDLAsset.new_with_url_vertex_descriptor_buffer_allocator (NSURL.new_with_string (NSString.new_with_utf8_string "../../engine/hulls/cc1_t2/CC1_TShape1.obj")) (MDLVertexDescriptor.nil ()) ((MTKMeshBufferAllocator.new_with_device device) :> MDLMeshBufferAllocator.t) in
  let mesh = new MDLMesh.t (asset#object_at_index (Ctypes.Uintptr.of_int 0))#get_id in
  let error = allocate ObjC.id ObjC.nil in
  let mesh = MTKMesh.new_with_mesh_device_error mesh device error in
  let mesh_buffer =  mesh#vertex_buffers#object_at_index (Ctypes.Uintptr.of_int 0) in
  let submeshes = mesh#submeshes in
  let uniform_buffer = device#new_buffer_with_length_options (Ctypes.Uintptr.of_int 192) 0 in
  let command_queue = device#new_command_queue#retain in
  let library = device#new_library_with_file_error (NSString.new_with_utf8_string "../../metal-rs/src/examples/example-04.metallib") error in
  let depth_stencil_descriptor = MTLDepthStencilDescriptor.depth_stencil_descriptor () in
  depth_stencil_descriptor#set_depth_compare_function 1;
  depth_stencil_descriptor#set_depth_write_enabled true;
  let depth_stencil_state = device#new_depth_stencil_state_with_descriptor depth_stencil_descriptor in
  let pipeline_descriptor = (MTLRenderPipelineDescriptor.alloc ())#init in
  pipeline_descriptor#set_vertex_function (library#new_function_with_name (NSString.new_with_utf8_string "vertex_main"));
  pipeline_descriptor#set_fragment_function (library#new_function_with_name (NSString.new_with_utf8_string "fragment_main"));
  pipeline_descriptor#set_depth_attachment_pixel_format 252;
  let color_attachments = pipeline_descriptor#color_attachments in
  let color_attachment = color_attachments#object_at_indexed_subscript (Ctypes.Uintptr.of_int 0) in
  color_attachment#set_pixel_format 80;
  let pipeline_state = device#new_render_pipeline_state_with_descriptor_error pipeline_descriptor error in
  result#set_object_ivar "mesh_buffer" (mesh_buffer :> ObjC.Object.t);
  result#set_object_ivar "submeshes" (submeshes :> ObjC.Object.t);
  result#set_object_ivar "uniform_buffer" (uniform_buffer :> ObjC.Object.t);
  result#set_object_ivar "command_queue" (command_queue :> ObjC.Object.t);
  result#set_object_ivar "depth_stencil_state" (depth_stencil_state :> ObjC.Object.t);
  result#set_object_ivar "pipeline_state" (pipeline_state :> ObjC.Object.t);
  result#set_color_pixel_format 80;
  result#set_clear_color (MTLClearColor.make 1.0 0.3 0.3 1.0);
  result#set_depth_stencil_pixel_format 252;
  result#set_clear_depth 1.0;
  result

let window =
  let result = NSWindow.new_with_content_rect_style_mask_backing_defer content_rect (Ctypes.Uintptr.of_int 7) (Ctypes.Uintptr.of_int 2) false in
  result#make_key_and_order_front (NSObject.nil ());
  result#set_title (NSString.new_with_utf8_string "Cocoa + OCaml = 🍪");
  result#set_delegate window_delegate;
  result#set_content_view (view :> NSView.t);
  result

let () = (NSApplication.shared_application ())#run
