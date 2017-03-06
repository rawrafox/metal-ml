open Ctypes
open Cocoa
open Cocoa.Implementation
open Cocoa.Implementation.Extern
open CoreAnimation
open CoreAnimation.Implementation
open CoreAnimation.Implementation.Extern
open CoreGraphics
open CoreGraphics.Implementation
open CoreGraphics.Implementation.Extern
open Foundation
open Foundation.Implementation
open Foundation.Implementation.Extern
open Metal
open Metal.Implementation
open Metal.Implementation.Extern
open ModelIo
open ModelIo.Implementation
open ModelIo.Implementation.Extern

module Implementation = struct
  module Extern = struct
    let mtk_mesh_class = ObjC.get_class "MTKMesh"
    let mtk_mesh_init_with_mesh_device_error = ObjC.message_send "initWithMesh:device:error:" (ObjC.id @-> ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)
    let mtk_mesh_get_submeshes = ObjC.message_send "submeshes" (returning ObjC.id)
    let mtk_mesh_set_submeshes = ObjC.message_send "setSubmeshes:" (ObjC.id @-> returning void)
    let mtk_mesh_get_vertex_buffers = ObjC.message_send "vertexBuffers" (returning ObjC.id)
    let mtk_mesh_set_vertex_buffers = ObjC.message_send "setVertexBuffers:" (ObjC.id @-> returning void)
    let mtk_mesh_get_vertex_count = ObjC.message_send "vertexCount" (returning nsu_integer)
    let mtk_mesh_set_vertex_count = ObjC.message_send "setVertexCount:" (nsu_integer @-> returning void)
    let mtk_mesh_get_vertex_descriptor = ObjC.message_send "vertexDescriptor" (returning ObjC.id)
    let mtk_mesh_set_vertex_descriptor = ObjC.message_send "setVertexDescriptor:" (ObjC.id @-> returning void)
    let mtk_mesh_get_name = ObjC.message_send "name" (returning ObjC.id)
    let mtk_mesh_set_name = ObjC.message_send "setName:" (ObjC.id @-> returning void)

    let mtk_mesh_buffer_class = ObjC.get_class "MTKMeshBuffer"
    let mtk_mesh_buffer_get_allocator = ObjC.message_send "allocator" (returning ObjC.id)
    let mtk_mesh_buffer_set_allocator = ObjC.message_send "setAllocator:" (ObjC.id @-> returning void)
    let mtk_mesh_buffer_get_buffer = ObjC.message_send "buffer" (returning ObjC.id)
    let mtk_mesh_buffer_set_buffer = ObjC.message_send "setBuffer:" (ObjC.id @-> returning void)
    let mtk_mesh_buffer_get_length = ObjC.message_send "length" (returning nsu_integer)
    let mtk_mesh_buffer_set_length = ObjC.message_send "setLength:" (nsu_integer @-> returning void)
    let mtk_mesh_buffer_get_offset = ObjC.message_send "offset" (returning nsu_integer)
    let mtk_mesh_buffer_set_offset = ObjC.message_send "setOffset:" (nsu_integer @-> returning void)

    let mtk_mesh_buffer_allocator_class = ObjC.get_class "MTKMeshBufferAllocator"
    let mtk_mesh_buffer_allocator_init_with_device = ObjC.message_send "initWithDevice:" (ObjC.id @-> returning ObjC.id)
    let mtk_mesh_buffer_allocator_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtk_mesh_buffer_allocator_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)

    let mtk_submesh_class = ObjC.get_class "MTKSubmesh"
    let mtk_submesh_get_mesh = ObjC.message_send "mesh" (returning ObjC.id)
    let mtk_submesh_set_mesh = ObjC.message_send "setMesh:" (ObjC.id @-> returning void)
    let mtk_submesh_get_index_buffer = ObjC.message_send "indexBuffer" (returning ObjC.id)
    let mtk_submesh_set_index_buffer = ObjC.message_send "setIndexBuffer:" (ObjC.id @-> returning void)
    let mtk_submesh_get_index_count = ObjC.message_send "indexCount" (returning nsu_integer)
    let mtk_submesh_set_index_count = ObjC.message_send "setIndexCount:" (nsu_integer @-> returning void)
    let mtk_submesh_get_index_type = ObjC.message_send "indexType" (returning mtl_index_type)
    let mtk_submesh_set_index_type = ObjC.message_send "setIndexType:" (mtl_index_type @-> returning void)
    let mtk_submesh_get_primitive_type = ObjC.message_send "primitiveType" (returning mtl_primitive_type)
    let mtk_submesh_set_primitive_type = ObjC.message_send "setPrimitiveType:" (mtl_primitive_type @-> returning void)
    let mtk_submesh_get_name = ObjC.message_send "name" (returning ObjC.id)
    let mtk_submesh_set_name = ObjC.message_send "setName:" (ObjC.id @-> returning void)

    let mtk_texture_loader_class = ObjC.get_class "MTKTextureLoader"
    let mtk_texture_loader_init_with_device = ObjC.message_send "initWithDevice:" (ObjC.id @-> returning ObjC.id)
    let mtk_texture_loader_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtk_texture_loader_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtk_texture_loader_new_texture_with_contents_of_url_options_error = ObjC.message_send "newTextureWithContentsOfURL:options:error:" (ObjC.id @-> ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)
    let mtk_texture_loader_new_textures_with_contents_of_ur_ls_options_error = ObjC.message_send "newTexturesWithContentsOfURLs:options:error:" (ObjC.id @-> ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)
    let mtk_texture_loader_new_texture_with_data_options_error = ObjC.message_send "newTextureWithData:options:error:" (ObjC.id @-> ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)
    let mtk_texture_loader_new_texture_with_mdl_texture_options_error = ObjC.message_send "newTextureWithMDLTexture:options:error:" (ObjC.id @-> ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)

    let mtk_view_class = ObjC.get_class "MTKView"
    let mtk_view_init_with_coder = ObjC.message_send "initWithCoder:" (ObjC.id @-> returning ObjC.id)
    let mtk_view_init_with_frame_device = ObjC.message_send "initWithFrame:device:" (cg_rect @-> ObjC.id @-> returning ObjC.id)
    let mtk_view_get_delegate = ObjC.message_send "delegate" (returning ObjC.id)
    let mtk_view_set_delegate = ObjC.message_send "setDelegate:" (ObjC.id @-> returning void)
    let mtk_view_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtk_view_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtk_view_get_clear_color = ObjC.message_send "clearColor" (returning mtl_clear_color)
    let mtk_view_set_clear_color = ObjC.message_send "setClearColor:" (mtl_clear_color @-> returning void)
    let mtk_view_get_clear_depth = ObjC.message_send "clearDepth" (returning double)
    let mtk_view_set_clear_depth = ObjC.message_send "setClearDepth:" (double @-> returning void)
    let mtk_view_get_clear_stencil = ObjC.message_send "clearStencil" (returning uint32_t)
    let mtk_view_set_clear_stencil = ObjC.message_send "setClearStencil:" (uint32_t @-> returning void)
    let mtk_view_get_color_pixel_format = ObjC.message_send "colorPixelFormat" (returning mtl_pixel_format)
    let mtk_view_set_color_pixel_format = ObjC.message_send "setColorPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtk_view_get_depth_stencil_pixel_format = ObjC.message_send "depthStencilPixelFormat" (returning mtl_pixel_format)
    let mtk_view_set_depth_stencil_pixel_format = ObjC.message_send "setDepthStencilPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtk_view_get_sample_count = ObjC.message_send "sampleCount" (returning nsu_integer)
    let mtk_view_set_sample_count = ObjC.message_send "setSampleCount:" (nsu_integer @-> returning void)
    let mtk_view_get_current_render_pass_descriptor = ObjC.message_send "currentRenderPassDescriptor" (returning ObjC.id)
    let mtk_view_set_current_render_pass_descriptor = ObjC.message_send "setCurrentRenderPassDescriptor:" (ObjC.id @-> returning void)
    let mtk_view_get_depth_stencil_texture = ObjC.message_send "depthStencilTexture" (returning ObjC.id)
    let mtk_view_set_depth_stencil_texture = ObjC.message_send "setDepthStencilTexture:" (ObjC.id @-> returning void)
    let mtk_view_get_multisample_color_texture = ObjC.message_send "multisampleColorTexture" (returning ObjC.id)
    let mtk_view_set_multisample_color_texture = ObjC.message_send "setMultisampleColorTexture:" (ObjC.id @-> returning void)
    let mtk_view_get_preferred_frames_per_second = ObjC.message_send "preferredFramesPerSecond" (returning ns_integer)
    let mtk_view_set_preferred_frames_per_second = ObjC.message_send "setPreferredFramesPerSecond:" (ns_integer @-> returning void)
    let mtk_view_get_paused = ObjC.message_send "isPaused" (returning bool)
    let mtk_view_set_paused = ObjC.message_send "setPaused:" (bool @-> returning void)
    let mtk_view_get_enable_set_needs_display = ObjC.message_send "enableSetNeedsDisplay" (returning bool)
    let mtk_view_set_enable_set_needs_display = ObjC.message_send "setEnableSetNeedsDisplay:" (bool @-> returning void)
    let mtk_view_draw = ObjC.message_send "draw" (returning void)
    let mtk_view_get_auto_resize_drawable = ObjC.message_send "autoResizeDrawable" (returning bool)
    let mtk_view_set_auto_resize_drawable = ObjC.message_send "setAutoResizeDrawable:" (bool @-> returning void)
    let mtk_view_get_current_drawable = ObjC.message_send "currentDrawable" (returning ObjC.id)
    let mtk_view_set_current_drawable = ObjC.message_send "setCurrentDrawable:" (ObjC.id @-> returning void)
    let mtk_view_get_drawable_size = ObjC.message_send "drawableSize" (returning cg_size)
    let mtk_view_set_drawable_size = ObjC.message_send "setDrawableSize:" (cg_size @-> returning void)
    let mtk_view_get_framebuffer_only = ObjC.message_send "framebufferOnly" (returning bool)
    let mtk_view_set_framebuffer_only = ObjC.message_send "setFramebufferOnly:" (bool @-> returning void)
    let mtk_view_get_presents_with_transaction = ObjC.message_send "presentsWithTransaction" (returning bool)
    let mtk_view_set_presents_with_transaction = ObjC.message_send "setPresentsWithTransaction:" (bool @-> returning void)
    let mtk_view_release_drawables = ObjC.message_send "releaseDrawables" (returning void)
    let mtk_view_delegate_mtk_view_drawable_size_will_change = ObjC.message_send "mtkView:drawableSizeWillChange:" (ObjC.id @-> cg_size @-> returning void)
    let mtk_view_delegate_draw_in_mtk_view = ObjC.message_send "drawInMTKView:" (ObjC.id @-> returning void)
  end

  open Extern

  class mtk_mesh (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init_with_mesh_device_error (mesh : mdl_mesh) (device : mtl_device) (error : ObjC.id ptr) = new mtk_mesh (mtk_mesh_init_with_mesh_device_error ptr mesh#get_id device#get_id error)
    method submeshes = new ns_array (mtk_mesh_get_submeshes ptr)
    method vertex_buffers = new ns_array (mtk_mesh_get_vertex_buffers ptr)
    method vertex_count = mtk_mesh_get_vertex_count ptr
    method vertex_descriptor = new mdl_vertex_descriptor (mtk_mesh_get_vertex_descriptor ptr)
    method name = new ns_string (mtk_mesh_get_name ptr)
    method set_name (value : ns_string) = mtk_mesh_set_name ptr value#get_id
  end and mtk_mesh_buffer (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method allocator = new mtk_mesh_buffer_allocator (mtk_mesh_buffer_get_allocator ptr)
    method buffer = new mtl_buffer (mtk_mesh_buffer_get_buffer ptr)
    method length = mtk_mesh_buffer_get_length ptr
    method offset = mtk_mesh_buffer_get_offset ptr
  end and mtk_mesh_buffer_allocator (ptr: ObjC.id) = object (self)
    inherit mdl_mesh_buffer_allocator ptr
    method init_with_device (device : mtl_device) = new mtk_mesh_buffer_allocator (mtk_mesh_buffer_allocator_init_with_device ptr device#get_id)
    method device = new mtl_device (mtk_mesh_buffer_allocator_get_device ptr)
    method set_device (value : mtl_device) = mtk_mesh_buffer_allocator_set_device ptr value#get_id
  end and mtk_submesh (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
    method mesh = new mtk_mesh (mtk_submesh_get_mesh ptr)
    method index_buffer = new mtk_mesh_buffer (mtk_submesh_get_index_buffer ptr)
    method index_count = mtk_submesh_get_index_count ptr
    method index_type = mtk_submesh_get_index_type ptr
    method primitive_type = mtk_submesh_get_primitive_type ptr
    method name = new ns_string (mtk_submesh_get_name ptr)
    method set_name (value : ns_string) = mtk_submesh_set_name ptr value#get_id
  end and mtk_texture_loader (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init_with_device (device : mtl_device) = new mtk_texture_loader (mtk_texture_loader_init_with_device ptr device#get_id)
    method device = new mtl_device (mtk_texture_loader_get_device ptr)
    method set_device (value : mtl_device) = mtk_texture_loader_set_device ptr value#get_id
    method new_texture_with_contents_of_url_options_error (url : nsurl) (options : ns_dictionary) (error : ObjC.id ptr) = new mtl_texture (mtk_texture_loader_new_texture_with_contents_of_url_options_error ptr url#get_id options#get_id error)
    method new_textures_with_contents_of_ur_ls_options_error (ur_ls : ns_array) (options : ns_dictionary) (error : ObjC.id ptr) = new ns_array (mtk_texture_loader_new_textures_with_contents_of_ur_ls_options_error ptr ur_ls#get_id options#get_id error)
    method new_texture_with_data_options_error (data : ns_data) (options : ns_dictionary) (error : ObjC.id ptr) = new mtl_texture (mtk_texture_loader_new_texture_with_data_options_error ptr data#get_id options#get_id error)
    method new_texture_with_mdl_texture_options_error (texture : mdl_texture) (options : ns_dictionary) (error : ObjC.id ptr) = new mtl_texture (mtk_texture_loader_new_texture_with_mdl_texture_options_error ptr texture#get_id options#get_id error)
  end and mtk_view (ptr: ObjC.id) = object (self)
    inherit ns_view ptr
    method init_with_coder (coder : ns_coder) = new mtk_view (mtk_view_init_with_coder ptr coder#get_id)
    method init_with_frame_device frame_rect (device : mtl_device) = new mtk_view (mtk_view_init_with_frame_device ptr frame_rect device#get_id)
    method delegate = new mtk_view_delegate (mtk_view_get_delegate ptr)
    method set_delegate (value : mtk_view_delegate) = mtk_view_set_delegate ptr value#get_id
    method device = new mtl_device (mtk_view_get_device ptr)
    method set_device (value : mtl_device) = mtk_view_set_device ptr value#get_id
    method clear_color = mtk_view_get_clear_color ptr
    method set_clear_color value = mtk_view_set_clear_color ptr value
    method clear_depth = mtk_view_get_clear_depth ptr
    method set_clear_depth value = mtk_view_set_clear_depth ptr value
    method clear_stencil = mtk_view_get_clear_stencil ptr
    method set_clear_stencil value = mtk_view_set_clear_stencil ptr value
    method color_pixel_format = mtk_view_get_color_pixel_format ptr
    method set_color_pixel_format value = mtk_view_set_color_pixel_format ptr value
    method depth_stencil_pixel_format = mtk_view_get_depth_stencil_pixel_format ptr
    method set_depth_stencil_pixel_format value = mtk_view_set_depth_stencil_pixel_format ptr value
    method sample_count = mtk_view_get_sample_count ptr
    method set_sample_count value = mtk_view_set_sample_count ptr value
    method current_render_pass_descriptor = new mtl_render_pass_descriptor (mtk_view_get_current_render_pass_descriptor ptr)
    method depth_stencil_texture = new mtl_texture (mtk_view_get_depth_stencil_texture ptr)
    method multisample_color_texture = new mtl_texture (mtk_view_get_multisample_color_texture ptr)
    method preferred_frames_per_second = mtk_view_get_preferred_frames_per_second ptr
    method set_preferred_frames_per_second value = mtk_view_set_preferred_frames_per_second ptr value
    method paused = mtk_view_get_paused ptr
    method set_paused value = mtk_view_set_paused ptr value
    method enable_set_needs_display = mtk_view_get_enable_set_needs_display ptr
    method set_enable_set_needs_display value = mtk_view_set_enable_set_needs_display ptr value
    method draw = mtk_view_draw ptr
    method auto_resize_drawable = mtk_view_get_auto_resize_drawable ptr
    method set_auto_resize_drawable value = mtk_view_set_auto_resize_drawable ptr value
    method current_drawable = new ca_metal_drawable (mtk_view_get_current_drawable ptr)
    method drawable_size = mtk_view_get_drawable_size ptr
    method set_drawable_size value = mtk_view_set_drawable_size ptr value
    method framebuffer_only = mtk_view_get_framebuffer_only ptr
    method set_framebuffer_only value = mtk_view_set_framebuffer_only ptr value
    method presents_with_transaction = mtk_view_get_presents_with_transaction ptr
    method set_presents_with_transaction value = mtk_view_set_presents_with_transaction ptr value
    method release_drawables = mtk_view_release_drawables ptr
  end and mtk_view_delegate (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method mtk_view_drawable_size_will_change (view : mtk_view) size = mtk_view_delegate_mtk_view_drawable_size_will_change ptr view#get_id size
    method draw_in_mtk_view (view : mtk_view) = mtk_view_delegate_draw_in_mtk_view ptr view#get_id
  end
end

open Implementation
open Implementation.Extern

module MTKMesh = struct
  class t = Implementation.mtk_mesh
  let klass = mtk_mesh_class

  let alloc () = new t (ObjC.alloc mtk_mesh_class)
  let nil () = new t (ObjC.nil)

  let new_with_mesh_device_error mesh device error = (alloc ())#init_with_mesh_device_error mesh device error
end

module MTKMeshBuffer = struct
  class t = Implementation.mtk_mesh_buffer
  let klass = mtk_mesh_buffer_class

  let alloc () = new t (ObjC.alloc mtk_mesh_buffer_class)
  let nil () = new t (ObjC.nil)
end

module MTKMeshBufferAllocator = struct
  class t = Implementation.mtk_mesh_buffer_allocator
  let klass = mtk_mesh_buffer_allocator_class

  let alloc () = new t (ObjC.alloc mtk_mesh_buffer_allocator_class)
  let nil () = new t (ObjC.nil)

  let new_with_device device = (alloc ())#init_with_device device
end

module MTKSubmesh = struct
  class t = Implementation.mtk_submesh
  let klass = mtk_submesh_class

  let alloc () = new t (ObjC.alloc mtk_submesh_class)
  let nil () = new t (ObjC.nil)
end

module MTKTextureLoader = struct
  class t = Implementation.mtk_texture_loader
  let klass = mtk_texture_loader_class

  let alloc () = new t (ObjC.alloc mtk_texture_loader_class)
  let nil () = new t (ObjC.nil)

  let new_with_device device = (alloc ())#init_with_device device
end

module MTKView = struct
  class t = Implementation.mtk_view
  let klass = mtk_view_class

  let alloc () = new t (ObjC.alloc mtk_view_class)
  let nil () = new t (ObjC.nil)

  let new_with_coder coder = (alloc ())#init_with_coder coder
  let new_with_frame_device frame_rect device = (alloc ())#init_with_frame_device frame_rect device
end

module MTKViewDelegate = struct
  class t = Implementation.mtk_view_delegate
end
