open Ctypes
open Foreign
open Objc
open Foundation

type mtl_clear_color
let mtl_clear_color  :  mtl_clear_color structure typ = structure "MTLClearColor"
let red = field mtl_clear_color "red" double
let green = field mtl_clear_color "green" double
let blue = field mtl_clear_color "blue" double
let alpha = field mtl_clear_color "alpha" double
let () = seal mtl_clear_color

let ffi_create_system_default_device = foreign "MTLCreateSystemDefaultDevice" (void @-> returning id)

class mtl_function (ptr : id) = object (self)
  inherit ns_object ptr as super
end

let new_function_with_name = message_send "newFunctionWithName:" (id @-> returning id)

class mtl_library (ptr : id) = object (self)
  inherit ns_object ptr as super

  method new_function_with_name (name:ns_string) = new mtl_function (new_function_with_name ptr name#get_id)
end

let set_pixel_format = message_send "setPixelFormat:" (int @-> returning void)

class mtl_render_pipeline_color_attachment_descriptor (ptr : id) = object (self)
  inherit ns_object ptr as super

  method set_pixel_format (pixel_format : int) = set_pixel_format ptr pixel_format
end

let object_at_indexed_subscript = message_send "objectAtIndexedSubscript:" (int @-> returning id)

class mtl_render_pipeline_color_attachment_descriptor_array (ptr : id) = object (self)
  inherit ns_object ptr as super

  method object_at_indexed_subscript (index : int) = new mtl_render_pipeline_color_attachment_descriptor (object_at_indexed_subscript ptr index)
end

let class_mtl_render_pipeline_descriptor = get_class "MTLRenderPipelineDescriptor"

let set_vertex_function = message_send "setVertexFunction:" (id @-> returning void)
let set_fragment_function = message_send "setFragmentFunction:" (id @-> returning void)

let color_attachments = message_send "colorAttachments" (returning id)

class mtl_render_pipeline_descriptor (ptr : id) = object (self)
  inherit ns_object ptr as super

  method init = new mtl_render_pipeline_descriptor (init ptr)

  method set_vertex_function (vertex_function:mtl_function) = set_vertex_function ptr vertex_function#get_id
  method set_fragment_function (fragment_function:mtl_function) = set_fragment_function ptr fragment_function#get_id

  method color_attachments = new mtl_render_pipeline_color_attachment_descriptor_array (color_attachments ptr)
end

let mtl_render_pipeline_descriptor_alloc () = new mtl_render_pipeline_descriptor (alloc class_mtl_render_pipeline_descriptor)

class mtl_render_pipeline_state (ptr : id) = object (self)
  inherit ns_object ptr as super
end

class mtl_buffer (ptr : id) = object (self)
  inherit ns_object ptr as super
end

class mtl_drawable (ptr : id) = object (self)
  inherit ns_object ptr as super
end

class mtl_render_pass_descriptor (ptr : id) = object (self)
  inherit ns_object ptr as super
end

let end_encoding = message_send "endEncoding" (returning void)

class mtl_command_encoder (ptr : id) = object (self)
  inherit ns_object ptr as super

  method end_encoding = end_encoding ptr
end

let set_vertex_buffer_offset_at_index = message_send "setVertexBuffer:offset:atIndex:" (id @-> int @-> int @-> returning void)
let set_render_pipeline_state = message_send "setRenderPipelineState:" (id @-> returning void)
let draw_primitives_vertex_start_vertex_count = message_send "drawPrimitives:vertexStart:vertexCount:" (int @-> int @-> int @-> returning void)

class mtl_render_command_encoder (ptr : id) = object (self)
  inherit mtl_command_encoder ptr as super

  method set_vertex_buffer_offset_at_index (buffer : mtl_buffer) (offset : int) (index : int) = set_vertex_buffer_offset_at_index ptr buffer#get_id offset index
  method set_render_pipeline_state (pipeline_state : mtl_render_pipeline_state) = set_render_pipeline_state ptr pipeline_state#get_id
  method draw_primitives_vertex_start_vertex_count (primitive_type : int) (start : int) (count : int) = draw_primitives_vertex_start_vertex_count ptr primitive_type start count
end

let commit = message_send "commit" (returning void)
let render_command_encoder_with_descriptor = message_send "renderCommandEncoderWithDescriptor:" (id @-> returning id)
let present_drawable = message_send "presentDrawable:" (id @-> returning void)

class mtl_command_buffer (ptr : id) = object (self)
  inherit ns_object ptr as super

  method commit = commit ptr
  method render_command_encoder_with_descriptor (descriptor : mtl_render_pass_descriptor) = new mtl_render_command_encoder (render_command_encoder_with_descriptor ptr descriptor#get_id)
  method present_drawable (drawable : mtl_drawable) = present_drawable ptr drawable#get_id
end

let command_buffer = message_send "commandBuffer" (returning id)

class mtl_command_queue (ptr : id) = object (self)
  inherit ns_object ptr as super

  method command_buffer = new mtl_command_buffer (command_buffer ptr)
end

let name = message_send "name" (returning id)
let new_buffer_with_bytes_length_options = message_send "newBufferWithBytes:length:options:" (ptr void @-> int @-> int @-> returning id)
let new_command_queue = message_send "newCommandQueue" (returning id)
let new_library_with_file_error = message_send "newLibraryWithFile:error:" (id @-> ptr void @-> returning id)
let new_render_pipeline_state_with_descriptor_error = message_send "newRenderPipelineStateWithDescriptor:error:" (id @-> ptr void @-> returning id)

class mtl_device (ptr : id) = object (self)
  inherit ns_object ptr as super

  method name = new ns_string (name ptr)
  method new_buffer_with_bytes_length_options (bytes : unit ptr) (length : int) (options : int) = new mtl_buffer (new_buffer_with_bytes_length_options ptr bytes length options)
  method new_command_queue = new mtl_command_queue (new_command_queue ptr)
  method new_library_with_file_error (path : ns_string) (error : unit ptr) = new mtl_library (new_library_with_file_error ptr path#get_id error)
  method new_render_pipeline_state_with_descriptor_error (descriptor : mtl_render_pipeline_descriptor) (error : unit ptr) = new mtl_render_pipeline_state (new_render_pipeline_state_with_descriptor_error ptr descriptor#get_id error)
end

let create_system_default_device () = new mtl_device (ffi_create_system_default_device ())
