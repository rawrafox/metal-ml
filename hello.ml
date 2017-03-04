open Ctypes
open Foreign
open Objc
open Foundation
open Cocoa
open Metal
open Metalkit

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

let window_delegate =
  let sel_window_will_close = register_name "windowWillClose:" in
  let implementation_window_will_close (_:id) (_:selector) (_:id) = (ns_application_shared_application ())#terminate ns_object_nil in
  let window_delegate_class = allocate_class class_ns_object "OCWindowDelegate" 0 in
  let _ = add_method window_delegate_class sel_window_will_close (coerce (funptr (id @-> selector @-> id @-> returning void)) implementation implementation_window_will_close) "v@:@" in
  register_class window_delegate_class;
  new ns_object (alloc window_delegate_class)

let content_rect =
  let content_origin = make cg_point in
  setf content_origin x 100.0;
  setf content_origin y 300.0;
  let content_size = make cg_size in
  setf content_size width 600.0;
  setf content_size height 600.0;
  let result = make cg_rect in
  setf result origin content_origin;
  setf result size content_size;
  result

let metal_device = create_system_default_device ()

let clear_color =
  let result = make mtl_clear_color in
  setf result red 1.0;
  setf result green 0.3;
  setf result blue 0.3;
  setf result alpha 1.0;
  result

let implementation_draw_rect (self:id) (_:selector) (_:cg_rect Ctypes.structure) =
  let view = new mtk_view self in
  let rv = allocate id nil in
  get_ivar self "command_queue" (to_voidp rv);
  let command_queue = new mtl_command_queue (!@ rv) in
  get_ivar self "pipeline_state" (to_voidp rv);
  let pipeline_state = new mtl_render_pipeline_state (!@ rv) in
  get_ivar self "buffer" (to_voidp rv);
  let buffer = new mtl_buffer (!@ rv) in
  let command_buffer = command_queue#command_buffer in
  let command_encoder = command_buffer#render_command_encoder_with_descriptor view#current_render_pass_descriptor in
  command_encoder#set_render_pipeline_state pipeline_state;
  command_encoder#set_vertex_buffer_offset_at_index buffer 0 0;
  command_encoder#draw_primitives_vertex_start_vertex_count 3 0 3;
  command_encoder#end_encoding;
  command_buffer#present_drawable view#current_drawable;
  command_buffer#commit

let view =
  let sel_draw_rect = register_name "drawRect:" in
  let view_class = allocate_class (get_class "MTKView") "OCView" 0 in
  let _ = add_ivar view_class "command_queue" 8 3 "@" in
  let _ = add_ivar view_class "buffer" 8 3 "@" in
  let _ = add_ivar view_class "pipeline_state" 8 3 "@" in
  let _ = add_method view_class sel_draw_rect (coerce (funptr (id @-> selector @-> cg_rect @-> returning void)) implementation implementation_draw_rect) "v@:{CGRect={CGPoint=dd}{CGSize=dd}}" in
  register_class view_class;
  let result = ((new mtk_view (alloc view_class))#init_with_frame_device content_rect metal_device)#retain in
  let device = result#device in
  let command_queue = device#new_command_queue#retain in
  set_ivar result#get_id "command_queue" (to_voidp command_queue#get_id);
  let buffer = device#new_buffer_with_bytes_length_options (to_voidp vertices) 96 0 in
  set_ivar result#get_id "buffer" (to_voidp buffer#get_id);
  let library = device#new_library_with_file_error (ns_string_from_string "../../metal-rs/src/examples/example-02.metallib") null in
  let pipeline_descriptor = (mtl_render_pipeline_descriptor_alloc ())#init in
  pipeline_descriptor#set_vertex_function (library#new_function_with_name (ns_string_from_string "vertex_main"));
  pipeline_descriptor#set_fragment_function (library#new_function_with_name (ns_string_from_string "fragment_main"));
  let color_attachments = pipeline_descriptor#color_attachments in
  let color_attachment = color_attachments#object_at_indexed_subscript 0 in
  color_attachment#set_pixel_format 80;
  let pipeline_state = device#new_render_pipeline_state_with_descriptor_error pipeline_descriptor null in
  set_ivar result#get_id "pipeline_state" (to_voidp pipeline_state#get_id);
  result#set_color_pixel_format(80);
  result#set_clear_color(clear_color);
  result

let window =
  let result = (ns_window_alloc ())#init_with_content_rect_style_mask_backing_defer content_rect 7 2 false in
  result#make_key_and_order_front ns_object_nil;
  result#set_title (ns_string_from_string "Cocoa + OCaml = 🍪");
  result#set_content_view (view :> ns_view);
  result#set_delegate window_delegate;
  result

let () = Printf.printf "Device Name: %s\n%!" metal_device#name#utf8_string
let () = (ns_application_shared_application ())#run  
