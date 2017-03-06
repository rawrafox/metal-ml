open Ctypes
open CoreFoundation
open CoreFoundation.Implementation
open CoreFoundation.Implementation.Extern
open Foundation
open Foundation.Implementation
open Foundation.Implementation.Extern

module Implementation = struct
  module Extern = struct
    type mtl_argument_access = int
    let mtl_argument_access = int

    type mtl_argument_type = int
    let mtl_argument_type = int

    type mtl_attribute_format = int
    let mtl_attribute_format = int

    type mtl_blend_factor = int
    let mtl_blend_factor = int

    type mtl_blend_operation = int
    let mtl_blend_operation = int

    type mtl_blit_option = int
    let mtl_blit_option = int

    type mtlcpu_cache_mode = int
    let mtlcpu_cache_mode = int

    type mtl_color_write_mask = int
    let mtl_color_write_mask = int

    type mtl_command_buffer_error = int
    let mtl_command_buffer_error = int

    type mtl_command_buffer_status = int
    let mtl_command_buffer_status = int

    type mtl_compare_function = int
    let mtl_compare_function = int

    type mtl_cull_mode = int
    let mtl_cull_mode = int

    type mtl_depth_clip_mode = int
    let mtl_depth_clip_mode = int

    type mtl_feature_set = int
    let mtl_feature_set = int

    type mtl_function_type = int
    let mtl_function_type = int

    type mtl_index_type = int
    let mtl_index_type = int

    type mtl_language_version = int
    let mtl_language_version = int

    type mtl_library_error = int
    let mtl_library_error = int

    type mtl_load_action = int
    let mtl_load_action = int

    type mtl_multisample_depth_resolve_filter = int
    let mtl_multisample_depth_resolve_filter = int

    type mtl_patch_type = int
    let mtl_patch_type = int

    type mtl_pipeline_option = int
    let mtl_pipeline_option = int

    type mtl_pixel_format = int
    let mtl_pixel_format = int

    type mtl_primitive_topology_class = int
    let mtl_primitive_topology_class = int

    type mtl_primitive_type = int
    let mtl_primitive_type = int

    type mtl_purgeable_state = int
    let mtl_purgeable_state = int

    type mtl_render_pipeline_error = int
    let mtl_render_pipeline_error = int

    type mtl_render_stages = int
    let mtl_render_stages = int

    type mtl_resource_options = int
    let mtl_resource_options = int

    type mtl_sampler_address_mode = int
    let mtl_sampler_address_mode = int

    type mtl_sampler_border_color = int
    let mtl_sampler_border_color = int

    type mtl_sampler_min_mag_filter = int
    let mtl_sampler_min_mag_filter = int

    type mtl_sampler_mip_filter = int
    let mtl_sampler_mip_filter = int

    type mtl_stencil_operation = int
    let mtl_stencil_operation = int

    type mtl_step_function = int
    let mtl_step_function = int

    type mtl_storage_mode = int
    let mtl_storage_mode = int

    type mtl_store_action = int
    let mtl_store_action = int

    type mtl_tessellation_control_point_index_type = int
    let mtl_tessellation_control_point_index_type = int

    type mtl_tessellation_factor_format = int
    let mtl_tessellation_factor_format = int

    type mtl_tessellation_factor_step_function = int
    let mtl_tessellation_factor_step_function = int

    type mtl_tessellation_partition_mode = int
    let mtl_tessellation_partition_mode = int

    type mtl_texture_type = int
    let mtl_texture_type = int

    type mtl_texture_usage = int
    let mtl_texture_usage = int

    type mtl_triangle_fill_mode = int
    let mtl_triangle_fill_mode = int

    type mtl_vertex_format = int
    let mtl_vertex_format = int

    type mtl_vertex_step_function = int
    let mtl_vertex_step_function = int

    type mtl_visibility_result_mode = int
    let mtl_visibility_result_mode = int

    type mtl_winding = int
    let mtl_winding = int

    type mtl_clear_color_t
    type mtl_clear_color = mtl_clear_color_t structure
    let mtl_clear_color : mtl_clear_color typ = structure "MTLClearColor"
    let mtl_clear_color_red = field mtl_clear_color "red" double
    let mtl_clear_color_green = field mtl_clear_color "green" double
    let mtl_clear_color_blue = field mtl_clear_color "blue" double
    let mtl_clear_color_alpha = field mtl_clear_color "alpha" double
    let () = seal mtl_clear_color

    type mtl_draw_indexed_primitives_indirect_arguments_t
    type mtl_draw_indexed_primitives_indirect_arguments = mtl_draw_indexed_primitives_indirect_arguments_t structure
    let mtl_draw_indexed_primitives_indirect_arguments : mtl_draw_indexed_primitives_indirect_arguments typ = structure "MTLDrawIndexedPrimitivesIndirectArguments"
    let mtl_draw_indexed_primitives_indirect_arguments_index_count = field mtl_draw_indexed_primitives_indirect_arguments "indexCount" uint32_t
    let mtl_draw_indexed_primitives_indirect_arguments_instance_count = field mtl_draw_indexed_primitives_indirect_arguments "instanceCount" uint32_t
    let mtl_draw_indexed_primitives_indirect_arguments_index_start = field mtl_draw_indexed_primitives_indirect_arguments "indexStart" uint32_t
    let mtl_draw_indexed_primitives_indirect_arguments_base_vertex = field mtl_draw_indexed_primitives_indirect_arguments "baseVertex" int32_t
    let mtl_draw_indexed_primitives_indirect_arguments_base_instance = field mtl_draw_indexed_primitives_indirect_arguments "baseInstance" uint32_t
    let () = seal mtl_draw_indexed_primitives_indirect_arguments

    type mtl_draw_patch_indirect_arguments_t
    type mtl_draw_patch_indirect_arguments = mtl_draw_patch_indirect_arguments_t structure
    let mtl_draw_patch_indirect_arguments : mtl_draw_patch_indirect_arguments typ = structure "MTLDrawPatchIndirectArguments"
    let mtl_draw_patch_indirect_arguments_patch_count = field mtl_draw_patch_indirect_arguments "patchCount" uint32_t
    let mtl_draw_patch_indirect_arguments_instance_count = field mtl_draw_patch_indirect_arguments "instanceCount" uint32_t
    let mtl_draw_patch_indirect_arguments_patch_start = field mtl_draw_patch_indirect_arguments "patchStart" uint32_t
    let mtl_draw_patch_indirect_arguments_base_instance = field mtl_draw_patch_indirect_arguments "baseInstance" uint32_t
    let () = seal mtl_draw_patch_indirect_arguments

    type mtl_draw_primitives_indirect_arguments_t
    type mtl_draw_primitives_indirect_arguments = mtl_draw_primitives_indirect_arguments_t structure
    let mtl_draw_primitives_indirect_arguments : mtl_draw_primitives_indirect_arguments typ = structure "MTLDrawPrimitivesIndirectArguments"
    let mtl_draw_primitives_indirect_arguments_vertex_count = field mtl_draw_primitives_indirect_arguments "vertexCount" uint32_t
    let mtl_draw_primitives_indirect_arguments_instance_count = field mtl_draw_primitives_indirect_arguments "instanceCount" uint32_t
    let mtl_draw_primitives_indirect_arguments_vertex_start = field mtl_draw_primitives_indirect_arguments "vertexStart" uint32_t
    let mtl_draw_primitives_indirect_arguments_base_instance = field mtl_draw_primitives_indirect_arguments "baseInstance" uint32_t
    let () = seal mtl_draw_primitives_indirect_arguments

    type mtl_origin_t
    type mtl_origin = mtl_origin_t structure
    let mtl_origin : mtl_origin typ = structure "MTLOrigin"
    let mtl_origin_x = field mtl_origin "x" nsu_integer
    let mtl_origin_y = field mtl_origin "y" nsu_integer
    let mtl_origin_z = field mtl_origin "z" nsu_integer
    let () = seal mtl_origin

    type mtl_scissor_rect_t
    type mtl_scissor_rect = mtl_scissor_rect_t structure
    let mtl_scissor_rect : mtl_scissor_rect typ = structure "MTLScissorRect"
    let mtl_scissor_rect_x = field mtl_scissor_rect "x" nsu_integer
    let mtl_scissor_rect_y = field mtl_scissor_rect "y" nsu_integer
    let mtl_scissor_rect_width = field mtl_scissor_rect "width" nsu_integer
    let mtl_scissor_rect_height = field mtl_scissor_rect "height" nsu_integer
    let () = seal mtl_scissor_rect

    type mtl_size_t
    type mtl_size = mtl_size_t structure
    let mtl_size : mtl_size typ = structure "MTLSize"
    let mtl_size_width = field mtl_size "width" nsu_integer
    let mtl_size_height = field mtl_size "height" nsu_integer
    let mtl_size_depth = field mtl_size "depth" nsu_integer
    let () = seal mtl_size

    type mtl_size_and_align_t
    type mtl_size_and_align = mtl_size_and_align_t structure
    let mtl_size_and_align : mtl_size_and_align typ = structure "MTLSizeAndAlign"
    let mtl_size_and_align_size = field mtl_size_and_align "size" nsu_integer
    let mtl_size_and_align_align = field mtl_size_and_align "align" nsu_integer
    let () = seal mtl_size_and_align

    type mtl_region_t
    type mtl_region = mtl_region_t structure
    let mtl_region : mtl_region typ = structure "MTLRegion"
    let mtl_region_origin = field mtl_region "origin" mtl_origin
    let mtl_region_size = field mtl_region "size" mtl_size
    let () = seal mtl_region

    type mtl_viewport_t
    type mtl_viewport = mtl_viewport_t structure
    let mtl_viewport : mtl_viewport typ = structure "MTLViewport"
    let mtl_viewport_origin_x = field mtl_viewport "originX" double
    let mtl_viewport_origin_y = field mtl_viewport "originY" double
    let mtl_viewport_width = field mtl_viewport "width" double
    let mtl_viewport_height = field mtl_viewport "height" double
    let mtl_viewport_znear = field mtl_viewport "znear" double
    let mtl_viewport_zfar = field mtl_viewport "zfar" double
    let () = seal mtl_viewport
    let mtl_command_encoder_end_encoding = ObjC.message_send "endEncoding" (returning void)
    let mtl_command_encoder_insert_debug_signpost = ObjC.message_send "insertDebugSignpost" (ObjC.id @-> returning void)
    let mtl_command_encoder_push_debug_group = ObjC.message_send "pushDebugGroup" (ObjC.id @-> returning void)
    let mtl_command_encoder_pop_debug_group = ObjC.message_send "popDebugGroup" (returning void)
    let mtl_command_encoder_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtl_command_encoder_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtl_command_encoder_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_command_encoder_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)

    let mtl_argument_class = ObjC.get_class "MTLArgument"

    let mtl_array_type_class = ObjC.get_class "MTLArrayType"

    let mtl_attribute_class = ObjC.get_class "MTLAttribute"

    let mtl_attribute_descriptor_class = ObjC.get_class "MTLAttributeDescriptor"

    let mtl_attribute_descriptor_array_class = ObjC.get_class "MTLAttributeDescriptorArray"
    let mtl_attribute_descriptor_array_object_at_index = ObjC.message_send "objectAtIndex:" (nsu_integer @-> returning ObjC.id)
    let mtl_attribute_descriptor_array_object_at_indexed_subscript = ObjC.message_send "objectAtIndexedSubscript:" (nsu_integer @-> returning ObjC.id)

    let mtl_buffer_layout_descriptor_class = ObjC.get_class "MTLBufferLayoutDescriptor"

    let mtl_buffer_layout_descriptor_array_class = ObjC.get_class "MTLBufferLayoutDescriptorArray"
    let mtl_buffer_layout_descriptor_array_object_at_index = ObjC.message_send "objectAtIndex:" (nsu_integer @-> returning ObjC.id)
    let mtl_buffer_layout_descriptor_array_object_at_indexed_subscript = ObjC.message_send "objectAtIndexedSubscript:" (nsu_integer @-> returning ObjC.id)

    let mtl_compile_options_class = ObjC.get_class "MTLCompileOptions"

    let mtl_compute_pipeline_descriptor_class = ObjC.get_class "MTLComputePipelineDescriptor"

    let mtl_compute_pipeline_reflection_class = ObjC.get_class "MTLComputePipelineReflection"

    let mtl_depth_stencil_descriptor_class = ObjC.get_class "MTLDepthStencilDescriptor"
    let mtl_depth_stencil_descriptor_init = ObjC.message_send "init" (returning ObjC.id)
    let mtl_depth_stencil_descriptor_get_depth_compare_function = ObjC.message_send "depthCompareFunction" (returning mtl_compare_function)
    let mtl_depth_stencil_descriptor_set_depth_compare_function = ObjC.message_send "setDepthCompareFunction:" (mtl_compare_function @-> returning void)
    let mtl_depth_stencil_descriptor_get_depth_write_enabled = ObjC.message_send "isDepthWriteEnabled" (returning bool)
    let mtl_depth_stencil_descriptor_set_depth_write_enabled = ObjC.message_send "setDepthWriteEnabled:" (bool @-> returning void)
    let mtl_depth_stencil_descriptor_get_back_face_stencil = ObjC.message_send "backFaceStencil" (returning ObjC.id)
    let mtl_depth_stencil_descriptor_set_back_face_stencil = ObjC.message_send "setBackFaceStencil:" (ObjC.id @-> returning void)
    let mtl_depth_stencil_descriptor_get_front_face_stencil = ObjC.message_send "frontFaceStencil" (returning ObjC.id)
    let mtl_depth_stencil_descriptor_set_front_face_stencil = ObjC.message_send "setFrontFaceStencil:" (ObjC.id @-> returning void)
    let mtl_depth_stencil_descriptor_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_depth_stencil_descriptor_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)

    let mtl_function_constant_class = ObjC.get_class "MTLFunctionConstant"

    let mtl_function_constant_values_class = ObjC.get_class "MTLFunctionConstantValues"

    let mtl_heap_descriptor_class = ObjC.get_class "MTLHeapDescriptor"

    let mtl_render_pass_attachment_descriptor_class = ObjC.get_class "MTLRenderPassAttachmentDescriptor"

    let mtl_render_pass_color_attachment_descriptor_class = ObjC.get_class "MTLRenderPassColorAttachmentDescriptor"

    let mtl_render_pass_color_attachment_descriptor_array_class = ObjC.get_class "MTLRenderPassColorAttachmentDescriptorArray"
    let mtl_render_pass_color_attachment_descriptor_array_object_at_index = ObjC.message_send "objectAtIndex:" (nsu_integer @-> returning ObjC.id)
    let mtl_render_pass_color_attachment_descriptor_array_object_at_indexed_subscript = ObjC.message_send "objectAtIndexedSubscript:" (nsu_integer @-> returning ObjC.id)

    let mtl_render_pass_depth_attachment_descriptor_class = ObjC.get_class "MTLRenderPassDepthAttachmentDescriptor"

    let mtl_render_pass_descriptor_class = ObjC.get_class "MTLRenderPassDescriptor"

    let mtl_render_pass_stencil_attachment_descriptor_class = ObjC.get_class "MTLRenderPassStencilAttachmentDescriptor"

    let mtl_render_pipeline_color_attachment_descriptor_class = ObjC.get_class "MTLRenderPipelineColorAttachmentDescriptor"
    let mtl_render_pipeline_color_attachment_descriptor_get_pixel_format = ObjC.message_send "pixelFormat" (returning mtl_pixel_format)
    let mtl_render_pipeline_color_attachment_descriptor_set_pixel_format = ObjC.message_send "setPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_write_mask = ObjC.message_send "writeMask" (returning mtl_color_write_mask)
    let mtl_render_pipeline_color_attachment_descriptor_set_write_mask = ObjC.message_send "setWriteMask:" (mtl_color_write_mask @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_blending_enabled = ObjC.message_send "isBlendingEnabled" (returning bool)
    let mtl_render_pipeline_color_attachment_descriptor_set_blending_enabled = ObjC.message_send "setBlendingEnabled:" (bool @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_alpha_blend_operation = ObjC.message_send "alphaBlendOperation" (returning mtl_blend_operation)
    let mtl_render_pipeline_color_attachment_descriptor_set_alpha_blend_operation = ObjC.message_send "setAlphaBlendOperation:" (mtl_blend_operation @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_rgb_blend_operation = ObjC.message_send "rgbBlendOperation" (returning mtl_blend_operation)
    let mtl_render_pipeline_color_attachment_descriptor_set_rgb_blend_operation = ObjC.message_send "setRgbBlendOperation:" (mtl_blend_operation @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_destination_alpha_blend_factor = ObjC.message_send "destinationAlphaBlendFactor" (returning mtl_blend_factor)
    let mtl_render_pipeline_color_attachment_descriptor_set_destination_alpha_blend_factor = ObjC.message_send "setDestinationAlphaBlendFactor:" (mtl_blend_factor @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_destination_rgb_blend_factor = ObjC.message_send "destinationRGBBlendFactor" (returning mtl_blend_factor)
    let mtl_render_pipeline_color_attachment_descriptor_set_destination_rgb_blend_factor = ObjC.message_send "setDestinationRGBBlendFactor:" (mtl_blend_factor @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_source_alpha_blend_factor = ObjC.message_send "sourceAlphaBlendFactor" (returning mtl_blend_factor)
    let mtl_render_pipeline_color_attachment_descriptor_set_source_alpha_blend_factor = ObjC.message_send "setSourceAlphaBlendFactor:" (mtl_blend_factor @-> returning void)
    let mtl_render_pipeline_color_attachment_descriptor_get_source_rgb_blend_factor = ObjC.message_send "sourceRGBBlendFactor" (returning mtl_blend_factor)
    let mtl_render_pipeline_color_attachment_descriptor_set_source_rgb_blend_factor = ObjC.message_send "setSourceRGBBlendFactor:" (mtl_blend_factor @-> returning void)

    let mtl_render_pipeline_color_attachment_descriptor_array_class = ObjC.get_class "MTLRenderPipelineColorAttachmentDescriptorArray"
    let mtl_render_pipeline_color_attachment_descriptor_array_object_at_index = ObjC.message_send "objectAtIndex:" (nsu_integer @-> returning ObjC.id)
    let mtl_render_pipeline_color_attachment_descriptor_array_object_at_indexed_subscript = ObjC.message_send "objectAtIndexedSubscript:" (nsu_integer @-> returning ObjC.id)

    let mtl_render_pipeline_descriptor_class = ObjC.get_class "MTLRenderPipelineDescriptor"
    let mtl_render_pipeline_descriptor_init = ObjC.message_send "init" (returning ObjC.id)
    let mtl_render_pipeline_descriptor_get_fragment_function = ObjC.message_send "fragmentFunction" (returning ObjC.id)
    let mtl_render_pipeline_descriptor_set_fragment_function = ObjC.message_send "setFragmentFunction:" (ObjC.id @-> returning void)
    let mtl_render_pipeline_descriptor_get_vertex_function = ObjC.message_send "vertexFunction" (returning ObjC.id)
    let mtl_render_pipeline_descriptor_set_vertex_function = ObjC.message_send "setVertexFunction:" (ObjC.id @-> returning void)
    let mtl_render_pipeline_descriptor_get_vertex_descriptor = ObjC.message_send "vertexDescriptor" (returning ObjC.id)
    let mtl_render_pipeline_descriptor_set_vertex_descriptor = ObjC.message_send "setVertexDescriptor:" (ObjC.id @-> returning void)
    let mtl_render_pipeline_descriptor_reset = ObjC.message_send "reset" (returning void)
    let mtl_render_pipeline_descriptor_get_color_attachments = ObjC.message_send "colorAttachments" (returning ObjC.id)
    let mtl_render_pipeline_descriptor_set_color_attachments = ObjC.message_send "setColorAttachments:" (ObjC.id @-> returning void)
    let mtl_render_pipeline_descriptor_get_depth_attachment_pixel_format = ObjC.message_send "depthAttachmentPixelFormat" (returning mtl_pixel_format)
    let mtl_render_pipeline_descriptor_set_depth_attachment_pixel_format = ObjC.message_send "setDepthAttachmentPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtl_render_pipeline_descriptor_get_stencil_attachment_pixel_format = ObjC.message_send "stencilAttachmentPixelFormat" (returning mtl_pixel_format)
    let mtl_render_pipeline_descriptor_set_stencil_attachment_pixel_format = ObjC.message_send "setStencilAttachmentPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtl_render_pipeline_descriptor_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_render_pipeline_descriptor_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)

    let mtl_render_pipeline_reflection_class = ObjC.get_class "MTLRenderPipelineReflection"

    let mtl_sampler_descriptor_class = ObjC.get_class "MTLSamplerDescriptor"
    let mtl_sampler_descriptor_init = ObjC.message_send "init" (returning ObjC.id)
    let mtl_sampler_descriptor_get_r_address_mode = ObjC.message_send "rAddressMode" (returning mtl_sampler_address_mode)
    let mtl_sampler_descriptor_set_r_address_mode = ObjC.message_send "setRAddressMode:" (mtl_sampler_address_mode @-> returning void)
    let mtl_sampler_descriptor_get_s_address_mode = ObjC.message_send "sAddressMode" (returning mtl_sampler_address_mode)
    let mtl_sampler_descriptor_set_s_address_mode = ObjC.message_send "setSAddressMode:" (mtl_sampler_address_mode @-> returning void)
    let mtl_sampler_descriptor_get_t_address_mode = ObjC.message_send "tAddressMode" (returning mtl_sampler_address_mode)
    let mtl_sampler_descriptor_set_t_address_mode = ObjC.message_send "setTAddressMode:" (mtl_sampler_address_mode @-> returning void)
    let mtl_sampler_descriptor_get_min_filter = ObjC.message_send "minFilter" (returning mtl_sampler_min_mag_filter)
    let mtl_sampler_descriptor_set_min_filter = ObjC.message_send "setMinFilter:" (mtl_sampler_min_mag_filter @-> returning void)
    let mtl_sampler_descriptor_get_mag_filter = ObjC.message_send "magFilter" (returning mtl_sampler_min_mag_filter)
    let mtl_sampler_descriptor_set_mag_filter = ObjC.message_send "setMagFilter:" (mtl_sampler_min_mag_filter @-> returning void)
    let mtl_sampler_descriptor_get_mip_filter = ObjC.message_send "mipFilter" (returning mtl_sampler_mip_filter)
    let mtl_sampler_descriptor_set_mip_filter = ObjC.message_send "setMipFilter:" (mtl_sampler_mip_filter @-> returning void)
    let mtl_sampler_descriptor_get_lod_min_clamp = ObjC.message_send "lodMinClamp" (returning float)
    let mtl_sampler_descriptor_set_lod_min_clamp = ObjC.message_send "setLodMinClamp:" (float @-> returning void)
    let mtl_sampler_descriptor_get_lod_max_clamp = ObjC.message_send "lodMaxClamp" (returning float)
    let mtl_sampler_descriptor_set_lod_max_clamp = ObjC.message_send "setLodMaxClamp:" (float @-> returning void)
    let mtl_sampler_descriptor_get_lod_average = ObjC.message_send "lodAverage" (returning bool)
    let mtl_sampler_descriptor_set_lod_average = ObjC.message_send "setLodAverage:" (bool @-> returning void)
    let mtl_sampler_descriptor_get_max_anisotropy = ObjC.message_send "maxAnisotropy" (returning nsu_integer)
    let mtl_sampler_descriptor_set_max_anisotropy = ObjC.message_send "setMaxAnisotropy:" (nsu_integer @-> returning void)
    let mtl_sampler_descriptor_get_normalized_coordinates = ObjC.message_send "normalizedCoordinates" (returning bool)
    let mtl_sampler_descriptor_set_normalized_coordinates = ObjC.message_send "setNormalizedCoordinates:" (bool @-> returning void)
    let mtl_sampler_descriptor_get_compare_function = ObjC.message_send "compareFunction" (returning mtl_compare_function)
    let mtl_sampler_descriptor_set_compare_function = ObjC.message_send "setCompareFunction:" (mtl_compare_function @-> returning void)
    let mtl_sampler_descriptor_get_border_color = ObjC.message_send "borderColor" (returning mtl_sampler_border_color)
    let mtl_sampler_descriptor_set_border_color = ObjC.message_send "setBorderColor:" (mtl_sampler_border_color @-> returning void)
    let mtl_sampler_descriptor_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_sampler_descriptor_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)

    let mtl_stage_input_output_descriptor_class = ObjC.get_class "MTLStageInputOutputDescriptor"

    let mtl_stencil_descriptor_class = ObjC.get_class "MTLStencilDescriptor"

    let mtl_struct_member_class = ObjC.get_class "MTLStructMember"

    let mtl_struct_type_class = ObjC.get_class "MTLStructType"

    let mtl_texture_descriptor_class = ObjC.get_class "MTLTextureDescriptor"
    let mtl_texture_descriptor_init = ObjC.message_send "init" (returning ObjC.id)
    let mtl_texture_descriptor_get_texture_type = ObjC.message_send "textureType" (returning mtl_texture_type)
    let mtl_texture_descriptor_set_texture_type = ObjC.message_send "setTextureType:" (mtl_texture_type @-> returning void)
    let mtl_texture_descriptor_get_pixel_format = ObjC.message_send "pixelFormat" (returning mtl_pixel_format)
    let mtl_texture_descriptor_set_pixel_format = ObjC.message_send "setPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtl_texture_descriptor_get_width = ObjC.message_send "width" (returning nsu_integer)
    let mtl_texture_descriptor_set_width = ObjC.message_send "setWidth:" (nsu_integer @-> returning void)
    let mtl_texture_descriptor_get_height = ObjC.message_send "height" (returning nsu_integer)
    let mtl_texture_descriptor_set_height = ObjC.message_send "setHeight:" (nsu_integer @-> returning void)
    let mtl_texture_descriptor_get_depth = ObjC.message_send "depth" (returning nsu_integer)
    let mtl_texture_descriptor_set_depth = ObjC.message_send "setDepth:" (nsu_integer @-> returning void)
    let mtl_texture_descriptor_get_mipmap_level_count = ObjC.message_send "mipmapLevelCount" (returning nsu_integer)
    let mtl_texture_descriptor_set_mipmap_level_count = ObjC.message_send "setMipmapLevelCount:" (nsu_integer @-> returning void)
    let mtl_texture_descriptor_get_sample_count = ObjC.message_send "sampleCount" (returning nsu_integer)
    let mtl_texture_descriptor_set_sample_count = ObjC.message_send "setSampleCount:" (nsu_integer @-> returning void)
    let mtl_texture_descriptor_get_array_length = ObjC.message_send "arrayLength" (returning nsu_integer)
    let mtl_texture_descriptor_set_array_length = ObjC.message_send "setArrayLength:" (nsu_integer @-> returning void)
    let mtl_texture_descriptor_get_resource_options = ObjC.message_send "resourceOptions" (returning mtl_resource_options)
    let mtl_texture_descriptor_set_resource_options = ObjC.message_send "setResourceOptions:" (mtl_resource_options @-> returning void)
    let mtl_texture_descriptor_get_cpu_cache_mode = ObjC.message_send "cpuCacheMode" (returning mtlcpu_cache_mode)
    let mtl_texture_descriptor_set_cpu_cache_mode = ObjC.message_send "setCpuCacheMode:" (mtlcpu_cache_mode @-> returning void)
    let mtl_texture_descriptor_get_storage_mode = ObjC.message_send "storageMode" (returning mtl_storage_mode)
    let mtl_texture_descriptor_set_storage_mode = ObjC.message_send "setStorageMode:" (mtl_storage_mode @-> returning void)
    let mtl_texture_descriptor_get_usage = ObjC.message_send "usage" (returning mtl_texture_usage)
    let mtl_texture_descriptor_set_usage = ObjC.message_send "setUsage:" (mtl_texture_usage @-> returning void)

    let mtl_vertex_attribute_class = ObjC.get_class "MTLVertexAttribute"

    let mtl_vertex_attribute_descriptor_class = ObjC.get_class "MTLVertexAttributeDescriptor"

    let mtl_vertex_attribute_descriptor_array_class = ObjC.get_class "MTLVertexAttributeDescriptorArray"
    let mtl_vertex_attribute_descriptor_array_object_at_index = ObjC.message_send "objectAtIndex:" (nsu_integer @-> returning ObjC.id)
    let mtl_vertex_attribute_descriptor_array_object_at_indexed_subscript = ObjC.message_send "objectAtIndexedSubscript:" (nsu_integer @-> returning ObjC.id)

    let mtl_vertex_buffer_layout_descriptor_class = ObjC.get_class "MTLVertexBufferLayoutDescriptor"

    let mtl_vertex_buffer_layout_descriptor_array_class = ObjC.get_class "MTLVertexBufferLayoutDescriptorArray"
    let mtl_vertex_buffer_layout_descriptor_array_object_at_index = ObjC.message_send "objectAtIndex:" (nsu_integer @-> returning ObjC.id)
    let mtl_vertex_buffer_layout_descriptor_array_object_at_indexed_subscript = ObjC.message_send "objectAtIndexedSubscript:" (nsu_integer @-> returning ObjC.id)

    let mtl_vertex_descriptor_class = ObjC.get_class "MTLVertexDescriptor"
    let mtl_buffer_contents = ObjC.message_send "contents" (returning (ptr void))
    let mtl_buffer_did_modify_range = ObjC.message_send "didModifyRange:" (ns_range @-> returning void)
    let mtl_buffer_get_length = ObjC.message_send "length" (returning nsu_integer)
    let mtl_buffer_set_length = ObjC.message_send "setLength:" (nsu_integer @-> returning void)
    let mtl_buffer_remove_all_debug_markers = ObjC.message_send "removeAllDebugMarkers" (returning void)
    let mtl_command_buffer_render_command_encoder_with_descriptor = ObjC.message_send "renderCommandEncoderWithDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mtl_command_buffer_compute_command_encoder = ObjC.message_send "computeCommandEncoder" (returning ObjC.id)
    let mtl_command_buffer_blit_command_encoder = ObjC.message_send "blitCommandEncoder" (returning ObjC.id)
    let mtl_command_buffer_parallel_render_command_encoder_with_descriptor = ObjC.message_send "parallelRenderCommandEncoderWithDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mtl_command_buffer_enqueue = ObjC.message_send "enqueue" (returning void)
    let mtl_command_buffer_commit = ObjC.message_send "commit" (returning void)
    let mtl_command_buffer_present_drawable = ObjC.message_send "presentDrawable:" (ObjC.id @-> returning void)
    let mtl_command_buffer_wait_until_scheduled = ObjC.message_send "waitUntilScheduled" (returning void)
    let mtl_command_buffer_wait_until_completed = ObjC.message_send "waitUntilCompleted" (returning void)
    let mtl_command_buffer_get_retained_references = ObjC.message_send "retainedReferences" (returning bool)
    let mtl_command_buffer_set_retained_references = ObjC.message_send "setRetainedReferences:" (bool @-> returning void)
    let mtl_command_buffer_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtl_command_buffer_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtl_command_buffer_get_command_queue = ObjC.message_send "commandQueue" (returning ObjC.id)
    let mtl_command_buffer_set_command_queue = ObjC.message_send "setCommandQueue:" (ObjC.id @-> returning void)
    let mtl_command_buffer_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_command_buffer_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)
    let mtl_command_queue_command_buffer = ObjC.message_send "commandBuffer" (returning ObjC.id)
    let mtl_command_queue_command_buffer_with_unretained_references = ObjC.message_send "commandBufferWithUnretainedReferences" (returning ObjC.id)
    let mtl_command_queue_insert_debug_capture_boundary = ObjC.message_send "insertDebugCaptureBoundary" (returning void)
    let mtl_command_queue_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtl_command_queue_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtl_command_queue_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_command_queue_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)
    let mtl_device_get_depth24_stencil8_pixel_format_supported = ObjC.message_send "isDepth24Stencil8PixelFormatSupported" (returning bool)
    let mtl_device_set_depth24_stencil8_pixel_format_supported = ObjC.message_send "setDepth24Stencil8PixelFormatSupported:" (bool @-> returning void)
    let mtl_device_get_headless = ObjC.message_send "isHeadless" (returning bool)
    let mtl_device_set_headless = ObjC.message_send "setHeadless:" (bool @-> returning void)
    let mtl_device_get_low_power = ObjC.message_send "isLowPower" (returning bool)
    let mtl_device_set_low_power = ObjC.message_send "setLowPower:" (bool @-> returning void)
    let mtl_device_get_max_threads_per_threadgroup = ObjC.message_send "maxThreadsPerThreadgroup" (returning mtl_size)
    let mtl_device_set_max_threads_per_threadgroup = ObjC.message_send "setMaxThreadsPerThreadgroup:" (mtl_size @-> returning void)
    let mtl_device_get_recommended_max_working_set_size = ObjC.message_send "recommendedMaxWorkingSetSize" (returning uint64_t)
    let mtl_device_set_recommended_max_working_set_size = ObjC.message_send "setRecommendedMaxWorkingSetSize:" (uint64_t @-> returning void)
    let mtl_device_get_name = ObjC.message_send "name" (returning ObjC.id)
    let mtl_device_set_name = ObjC.message_send "setName:" (ObjC.id @-> returning void)
    let mtl_device_supports_feature_set = ObjC.message_send "supportsFeatureSet:" (mtl_feature_set @-> returning bool)
    let mtl_device_supports_texture_sample_count = ObjC.message_send "supportsTextureSampleCount:" (nsu_integer @-> returning bool)
    let mtl_device_new_default_library = ObjC.message_send "newDefaultLibrary" (returning void)
    let mtl_device_new_library_with_file_error = ObjC.message_send "newLibraryWithFile:error:" (ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)
    let mtl_device_new_command_queue = ObjC.message_send "newCommandQueue" (returning ObjC.id)
    let mtl_device_new_command_queue_with_max_command_buffer_count = ObjC.message_send "newCommandQueueWithMaxCommandBufferCount" (nsu_integer @-> returning ObjC.id)
    let mtl_device_new_buffer_with_length_options = ObjC.message_send "newBufferWithLength:options:" (nsu_integer @-> mtl_resource_options @-> returning ObjC.id)
    let mtl_device_new_buffer_with_bytes_length_options = ObjC.message_send "newBufferWithBytes:length:options:" ((ptr void) @-> nsu_integer @-> mtl_resource_options @-> returning ObjC.id)
    let mtl_device_new_texture_with_descriptor = ObjC.message_send "newTextureWithDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mtl_device_new_heap_with_descriptor = ObjC.message_send "newHeapWithDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mtl_device_heap_buffer_size_and_align_with_length_options = ObjC.message_send "heapBufferSizeAndAlignWithLength:options:" (nsu_integer @-> mtl_resource_options @-> returning mtl_size_and_align)
    let mtl_device_heap_texture_size_and_align_with_descriptor = ObjC.message_send "heapTextureSizeAndAlignWithDescriptor:" (ObjC.id @-> returning mtl_size_and_align)
    let mtl_device_new_fence = ObjC.message_send "newFence" (returning ObjC.id)
    let mtl_device_new_sampler_state_with_descriptor = ObjC.message_send "newSamplerStateWithDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mtl_device_new_render_pipeline_state_with_descriptor_error = ObjC.message_send "newRenderPipelineStateWithDescriptor:error:" (ObjC.id @-> ptr ObjC.id @-> returning ObjC.id)
    let mtl_device_new_depth_stencil_state_with_descriptor = ObjC.message_send "newDepthStencilStateWithDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mtl_drawable_present = ObjC.message_send "present" (returning void)
    let mtl_fence_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtl_fence_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtl_fence_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_fence_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)
    let mtl_library_new_function_with_name = ObjC.message_send "newFunctionWithName:" (ObjC.id @-> returning ObjC.id)
    let mtl_library_get_function_names = ObjC.message_send "functionNames" (returning ObjC.id)
    let mtl_library_set_function_names = ObjC.message_send "setFunctionNames:" (ObjC.id @-> returning void)
    let mtl_library_get_device = ObjC.message_send "device" (returning ObjC.id)
    let mtl_library_set_device = ObjC.message_send "setDevice:" (ObjC.id @-> returning void)
    let mtl_library_get_label = ObjC.message_send "label" (returning ObjC.id)
    let mtl_library_set_label = ObjC.message_send "setLabel:" (ObjC.id @-> returning void)
    let mtl_render_command_encoder_set_blend_color_red_green_blue_alpha = ObjC.message_send "setBlendColorRed:green:blue:alpha:" (float @-> float @-> float @-> float @-> returning void)
    let mtl_render_command_encoder_set_cull_mode = ObjC.message_send "setCullMode:" (mtl_cull_mode @-> returning void)
    let mtl_render_command_encoder_set_depth_bias_slope_scale_clamp = ObjC.message_send "setDepthBias:slopeScale:clamp:" (float @-> float @-> float @-> returning void)
    let mtl_render_command_encoder_set_depth_clip_mode = ObjC.message_send "setDepthClipMode:" (mtl_depth_clip_mode @-> returning void)
    let mtl_render_command_encoder_set_depth_stencil_state = ObjC.message_send "setDepthStencilState:" (ObjC.id @-> returning void)
    let mtl_render_command_encoder_set_front_facing_winding = ObjC.message_send "setFrontFacingWinding:" (mtl_winding @-> returning void)
    let mtl_render_command_encoder_set_render_pipeline_state = ObjC.message_send "setRenderPipelineState:" (ObjC.id @-> returning void)
    let mtl_render_command_encoder_set_scissor_rect = ObjC.message_send "setScissorRect:" (mtl_scissor_rect @-> returning void)
    let mtl_render_command_encoder_set_stencil_front_reference_value_back_reference_value = ObjC.message_send "setStencilFrontReferenceValue:backReferenceValue:" (uint32_t @-> uint32_t @-> returning void)
    let mtl_render_command_encoder_set_stencil_reference_value = ObjC.message_send "setStencilReferenceValue:" (uint32_t @-> returning void)
    let mtl_render_command_encoder_set_triangle_fill_mode = ObjC.message_send "setTriangleFillMode:" (mtl_triangle_fill_mode @-> returning void)
    let mtl_render_command_encoder_set_viewport = ObjC.message_send "setViewport:" (mtl_viewport @-> returning void)
    let mtl_render_command_encoder_set_visibility_result_mode_offset = ObjC.message_send "setVisibilityResultMode:offset:" (mtl_visibility_result_mode @-> nsu_integer @-> returning void)
    let mtl_render_command_encoder_set_vertex_buffer_offset_at_index = ObjC.message_send "setVertexBuffer:offset:atIndex:" (ObjC.id @-> nsu_integer @-> nsu_integer @-> returning void)
    let mtl_render_command_encoder_set_fragment_buffer_offset_at_index = ObjC.message_send "setFragmentBuffer:offset:atIndex:" (ObjC.id @-> nsu_integer @-> nsu_integer @-> returning void)
    let mtl_render_command_encoder_set_fragment_sampler_state_at_index = ObjC.message_send "setFragmentSamplerState:atIndex:" (ObjC.id @-> nsu_integer @-> returning void)
    let mtl_render_command_encoder_set_fragment_texture_at_index = ObjC.message_send "setFragmentTexture:atIndex:" (ObjC.id @-> nsu_integer @-> returning void)
    let mtl_render_command_encoder_draw_primitives_vertex_start_vertex_count = ObjC.message_send "drawPrimitives:vertexStart:vertexCount:" (mtl_primitive_type @-> nsu_integer @-> nsu_integer @-> returning void)
    let mtl_render_command_encoder_draw_indexed_primitives_index_count_index_type_index_buffer_index_buffer_offset = ObjC.message_send "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:" (mtl_primitive_type @-> nsu_integer @-> mtl_index_type @-> ObjC.id @-> nsu_integer @-> returning void)
    let mtl_texture_replace_region_mipmap_level_slice_with_bytes_bytes_per_row_bytes_per_image = ObjC.message_send "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:" (mtl_region @-> nsu_integer @-> nsu_integer @-> (ptr void) @-> nsu_integer @-> nsu_integer @-> returning void)
    let mtl_texture_replace_region_mipmap_level_with_bytes_bytes_per_row = ObjC.message_send "replaceRegion:mipmapLevel:withBytes:bytesPerRow:" (mtl_region @-> nsu_integer @-> (ptr void) @-> nsu_integer @-> returning void)
    let mtl_texture_get_texture_type = ObjC.message_send "textureType" (returning mtl_texture_type)
    let mtl_texture_set_texture_type = ObjC.message_send "setTextureType:" (mtl_texture_type @-> returning void)
    let mtl_texture_get_pixel_format = ObjC.message_send "pixelFormat" (returning mtl_pixel_format)
    let mtl_texture_set_pixel_format = ObjC.message_send "setPixelFormat:" (mtl_pixel_format @-> returning void)
    let mtl_texture_get_width = ObjC.message_send "width" (returning nsu_integer)
    let mtl_texture_set_width = ObjC.message_send "setWidth:" (nsu_integer @-> returning void)
    let mtl_texture_get_height = ObjC.message_send "height" (returning nsu_integer)
    let mtl_texture_set_height = ObjC.message_send "setHeight:" (nsu_integer @-> returning void)
    let mtl_texture_get_depth = ObjC.message_send "depth" (returning nsu_integer)
    let mtl_texture_set_depth = ObjC.message_send "setDepth:" (nsu_integer @-> returning void)
    let mtl_texture_get_mipmap_level_count = ObjC.message_send "mipmapLevelCount" (returning nsu_integer)
    let mtl_texture_set_mipmap_level_count = ObjC.message_send "setMipmapLevelCount:" (nsu_integer @-> returning void)
    let mtl_texture_get_array_length = ObjC.message_send "arrayLength" (returning nsu_integer)
    let mtl_texture_set_array_length = ObjC.message_send "setArrayLength:" (nsu_integer @-> returning void)
    let mtl_texture_get_sample_count = ObjC.message_send "sampleCount" (returning nsu_integer)
    let mtl_texture_set_sample_count = ObjC.message_send "setSampleCount:" (nsu_integer @-> returning void)
    let mtl_texture_get_framebuffer_only = ObjC.message_send "framebufferOnly" (returning bool)
    let mtl_texture_set_framebuffer_only = ObjC.message_send "setFramebufferOnly:" (bool @-> returning void)
    let mtl_texture_get_usage = ObjC.message_send "usage" (returning mtl_texture_usage)
    let mtl_texture_set_usage = ObjC.message_send "setUsage:" (mtl_texture_usage @-> returning void)

    let mtl_copy_all_devices = Foreign.foreign "MTLCopyAllDevices" (void @-> returning ObjC.id)

    let mtl_create_system_default_device = Foreign.foreign "MTLCreateSystemDefaultDevice" (void @-> returning ObjC.id)
  end

  open Extern

  class mtl_command_encoder (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method end_encoding = mtl_command_encoder_end_encoding ptr
    method insert_debug_signpost (string : ns_string) = mtl_command_encoder_insert_debug_signpost ptr string#get_id
    method push_debug_group (string : ns_string) = mtl_command_encoder_push_debug_group ptr string#get_id
    method pop_debug_group = mtl_command_encoder_pop_debug_group ptr
    method device = new mtl_device (mtl_command_encoder_get_device ptr)
    method label = new ns_string (mtl_command_encoder_get_label ptr)
    method set_label (value : ns_string) = mtl_command_encoder_set_label ptr value#get_id
  end and mtl_resource (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_argument (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_array_type (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_attribute (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_attribute_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_attribute_descriptor_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method object_at_index index = new mtl_attribute_descriptor (mtl_attribute_descriptor_array_object_at_index ptr index)
    method object_at_indexed_subscript index = new mtl_attribute_descriptor (mtl_attribute_descriptor_array_object_at_indexed_subscript ptr index)
  end and mtl_buffer_layout_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_buffer_layout_descriptor_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method object_at_index index = new mtl_buffer_layout_descriptor (mtl_buffer_layout_descriptor_array_object_at_index ptr index)
    method object_at_indexed_subscript index = new mtl_buffer_layout_descriptor (mtl_buffer_layout_descriptor_array_object_at_indexed_subscript ptr index)
  end and mtl_compile_options (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_compute_pipeline_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_compute_pipeline_reflection (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_depth_stencil_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new mtl_depth_stencil_descriptor (mtl_depth_stencil_descriptor_init ptr)
    method depth_compare_function = mtl_depth_stencil_descriptor_get_depth_compare_function ptr
    method set_depth_compare_function value = mtl_depth_stencil_descriptor_set_depth_compare_function ptr value
    method depth_write_enabled = mtl_depth_stencil_descriptor_get_depth_write_enabled ptr
    method set_depth_write_enabled value = mtl_depth_stencil_descriptor_set_depth_write_enabled ptr value
    method back_face_stencil = new mtl_stencil_descriptor (mtl_depth_stencil_descriptor_get_back_face_stencil ptr)
    method set_back_face_stencil (value : mtl_stencil_descriptor) = mtl_depth_stencil_descriptor_set_back_face_stencil ptr value#get_id
    method front_face_stencil = new mtl_stencil_descriptor (mtl_depth_stencil_descriptor_get_front_face_stencil ptr)
    method set_front_face_stencil (value : mtl_stencil_descriptor) = mtl_depth_stencil_descriptor_set_front_face_stencil ptr value#get_id
    method label = new ns_string (mtl_depth_stencil_descriptor_get_label ptr)
    method set_label (value : ns_string) = mtl_depth_stencil_descriptor_set_label ptr value#get_id
  end and mtl_function_constant (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_function_constant_values (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_heap_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_render_pass_attachment_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_render_pass_color_attachment_descriptor (ptr: ObjC.id) = object (self)
    inherit mtl_render_pass_attachment_descriptor ptr
  end and mtl_render_pass_color_attachment_descriptor_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method object_at_index index = new mtl_render_pass_color_attachment_descriptor (mtl_render_pass_color_attachment_descriptor_array_object_at_index ptr index)
    method object_at_indexed_subscript index = new mtl_render_pass_color_attachment_descriptor (mtl_render_pass_color_attachment_descriptor_array_object_at_indexed_subscript ptr index)
  end and mtl_render_pass_depth_attachment_descriptor (ptr: ObjC.id) = object (self)
    inherit mtl_render_pass_attachment_descriptor ptr
  end and mtl_render_pass_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_render_pass_stencil_attachment_descriptor (ptr: ObjC.id) = object (self)
    inherit mtl_render_pass_attachment_descriptor ptr
  end and mtl_render_pipeline_color_attachment_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method pixel_format = mtl_render_pipeline_color_attachment_descriptor_get_pixel_format ptr
    method set_pixel_format value = mtl_render_pipeline_color_attachment_descriptor_set_pixel_format ptr value
    method write_mask = mtl_render_pipeline_color_attachment_descriptor_get_write_mask ptr
    method set_write_mask value = mtl_render_pipeline_color_attachment_descriptor_set_write_mask ptr value
    method blending_enabled = mtl_render_pipeline_color_attachment_descriptor_get_blending_enabled ptr
    method set_blending_enabled value = mtl_render_pipeline_color_attachment_descriptor_set_blending_enabled ptr value
    method alpha_blend_operation = mtl_render_pipeline_color_attachment_descriptor_get_alpha_blend_operation ptr
    method set_alpha_blend_operation value = mtl_render_pipeline_color_attachment_descriptor_set_alpha_blend_operation ptr value
    method rgb_blend_operation = mtl_render_pipeline_color_attachment_descriptor_get_rgb_blend_operation ptr
    method set_rgb_blend_operation value = mtl_render_pipeline_color_attachment_descriptor_set_rgb_blend_operation ptr value
    method destination_alpha_blend_factor = mtl_render_pipeline_color_attachment_descriptor_get_destination_alpha_blend_factor ptr
    method set_destination_alpha_blend_factor value = mtl_render_pipeline_color_attachment_descriptor_set_destination_alpha_blend_factor ptr value
    method destination_rgb_blend_factor = mtl_render_pipeline_color_attachment_descriptor_get_destination_rgb_blend_factor ptr
    method set_destination_rgb_blend_factor value = mtl_render_pipeline_color_attachment_descriptor_set_destination_rgb_blend_factor ptr value
    method source_alpha_blend_factor = mtl_render_pipeline_color_attachment_descriptor_get_source_alpha_blend_factor ptr
    method set_source_alpha_blend_factor value = mtl_render_pipeline_color_attachment_descriptor_set_source_alpha_blend_factor ptr value
    method source_rgb_blend_factor = mtl_render_pipeline_color_attachment_descriptor_get_source_rgb_blend_factor ptr
    method set_source_rgb_blend_factor value = mtl_render_pipeline_color_attachment_descriptor_set_source_rgb_blend_factor ptr value
  end and mtl_render_pipeline_color_attachment_descriptor_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method object_at_index index = new mtl_render_pipeline_color_attachment_descriptor (mtl_render_pipeline_color_attachment_descriptor_array_object_at_index ptr index)
    method object_at_indexed_subscript index = new mtl_render_pipeline_color_attachment_descriptor (mtl_render_pipeline_color_attachment_descriptor_array_object_at_indexed_subscript ptr index)
  end and mtl_render_pipeline_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new mtl_render_pipeline_descriptor (mtl_render_pipeline_descriptor_init ptr)
    method fragment_function = new mtl_function (mtl_render_pipeline_descriptor_get_fragment_function ptr)
    method set_fragment_function (value : mtl_function) = mtl_render_pipeline_descriptor_set_fragment_function ptr value#get_id
    method vertex_function = new mtl_function (mtl_render_pipeline_descriptor_get_vertex_function ptr)
    method set_vertex_function (value : mtl_function) = mtl_render_pipeline_descriptor_set_vertex_function ptr value#get_id
    method vertex_descriptor = new mtl_vertex_descriptor (mtl_render_pipeline_descriptor_get_vertex_descriptor ptr)
    method set_vertex_descriptor (value : mtl_vertex_descriptor) = mtl_render_pipeline_descriptor_set_vertex_descriptor ptr value#get_id
    method reset = mtl_render_pipeline_descriptor_reset ptr
    method color_attachments = new mtl_render_pipeline_color_attachment_descriptor_array (mtl_render_pipeline_descriptor_get_color_attachments ptr)
    method set_color_attachments (value : mtl_render_pipeline_color_attachment_descriptor_array) = mtl_render_pipeline_descriptor_set_color_attachments ptr value#get_id
    method depth_attachment_pixel_format = mtl_render_pipeline_descriptor_get_depth_attachment_pixel_format ptr
    method set_depth_attachment_pixel_format value = mtl_render_pipeline_descriptor_set_depth_attachment_pixel_format ptr value
    method stencil_attachment_pixel_format = mtl_render_pipeline_descriptor_get_stencil_attachment_pixel_format ptr
    method set_stencil_attachment_pixel_format value = mtl_render_pipeline_descriptor_set_stencil_attachment_pixel_format ptr value
    method label = new ns_string (mtl_render_pipeline_descriptor_get_label ptr)
    method set_label (value : ns_string) = mtl_render_pipeline_descriptor_set_label ptr value#get_id
  end and mtl_render_pipeline_reflection (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_sampler_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new mtl_sampler_descriptor (mtl_sampler_descriptor_init ptr)
    method r_address_mode = mtl_sampler_descriptor_get_r_address_mode ptr
    method set_r_address_mode value = mtl_sampler_descriptor_set_r_address_mode ptr value
    method s_address_mode = mtl_sampler_descriptor_get_s_address_mode ptr
    method set_s_address_mode value = mtl_sampler_descriptor_set_s_address_mode ptr value
    method t_address_mode = mtl_sampler_descriptor_get_t_address_mode ptr
    method set_t_address_mode value = mtl_sampler_descriptor_set_t_address_mode ptr value
    method min_filter = mtl_sampler_descriptor_get_min_filter ptr
    method set_min_filter value = mtl_sampler_descriptor_set_min_filter ptr value
    method mag_filter = mtl_sampler_descriptor_get_mag_filter ptr
    method set_mag_filter value = mtl_sampler_descriptor_set_mag_filter ptr value
    method mip_filter = mtl_sampler_descriptor_get_mip_filter ptr
    method set_mip_filter value = mtl_sampler_descriptor_set_mip_filter ptr value
    method lod_min_clamp = mtl_sampler_descriptor_get_lod_min_clamp ptr
    method set_lod_min_clamp value = mtl_sampler_descriptor_set_lod_min_clamp ptr value
    method lod_max_clamp = mtl_sampler_descriptor_get_lod_max_clamp ptr
    method set_lod_max_clamp value = mtl_sampler_descriptor_set_lod_max_clamp ptr value
    method lod_average = mtl_sampler_descriptor_get_lod_average ptr
    method set_lod_average value = mtl_sampler_descriptor_set_lod_average ptr value
    method max_anisotropy = mtl_sampler_descriptor_get_max_anisotropy ptr
    method set_max_anisotropy value = mtl_sampler_descriptor_set_max_anisotropy ptr value
    method normalized_coordinates = mtl_sampler_descriptor_get_normalized_coordinates ptr
    method set_normalized_coordinates value = mtl_sampler_descriptor_set_normalized_coordinates ptr value
    method compare_function = mtl_sampler_descriptor_get_compare_function ptr
    method set_compare_function value = mtl_sampler_descriptor_set_compare_function ptr value
    method border_color = mtl_sampler_descriptor_get_border_color ptr
    method set_border_color value = mtl_sampler_descriptor_set_border_color ptr value
    method label = new ns_string (mtl_sampler_descriptor_get_label ptr)
    method set_label (value : ns_string) = mtl_sampler_descriptor_set_label ptr value#get_id
  end and mtl_stage_input_output_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_stencil_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_struct_member (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_struct_type (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_texture_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new mtl_texture_descriptor (mtl_texture_descriptor_init ptr)
    method texture_type = mtl_texture_descriptor_get_texture_type ptr
    method set_texture_type value = mtl_texture_descriptor_set_texture_type ptr value
    method pixel_format = mtl_texture_descriptor_get_pixel_format ptr
    method set_pixel_format value = mtl_texture_descriptor_set_pixel_format ptr value
    method width = mtl_texture_descriptor_get_width ptr
    method set_width value = mtl_texture_descriptor_set_width ptr value
    method height = mtl_texture_descriptor_get_height ptr
    method set_height value = mtl_texture_descriptor_set_height ptr value
    method depth = mtl_texture_descriptor_get_depth ptr
    method set_depth value = mtl_texture_descriptor_set_depth ptr value
    method mipmap_level_count = mtl_texture_descriptor_get_mipmap_level_count ptr
    method set_mipmap_level_count value = mtl_texture_descriptor_set_mipmap_level_count ptr value
    method sample_count = mtl_texture_descriptor_get_sample_count ptr
    method set_sample_count value = mtl_texture_descriptor_set_sample_count ptr value
    method array_length = mtl_texture_descriptor_get_array_length ptr
    method set_array_length value = mtl_texture_descriptor_set_array_length ptr value
    method resource_options = mtl_texture_descriptor_get_resource_options ptr
    method set_resource_options value = mtl_texture_descriptor_set_resource_options ptr value
    method cpu_cache_mode = mtl_texture_descriptor_get_cpu_cache_mode ptr
    method set_cpu_cache_mode value = mtl_texture_descriptor_set_cpu_cache_mode ptr value
    method storage_mode = mtl_texture_descriptor_get_storage_mode ptr
    method set_storage_mode value = mtl_texture_descriptor_set_storage_mode ptr value
    method usage = mtl_texture_descriptor_get_usage ptr
    method set_usage value = mtl_texture_descriptor_set_usage ptr value
  end and mtl_vertex_attribute (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_vertex_attribute_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_vertex_attribute_descriptor_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method object_at_index index = new mtl_vertex_attribute_descriptor (mtl_vertex_attribute_descriptor_array_object_at_index ptr index)
    method object_at_indexed_subscript index = new mtl_vertex_attribute_descriptor (mtl_vertex_attribute_descriptor_array_object_at_indexed_subscript ptr index)
  end and mtl_vertex_buffer_layout_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_vertex_buffer_layout_descriptor_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method object_at_index index = new mtl_vertex_buffer_layout_descriptor (mtl_vertex_buffer_layout_descriptor_array_object_at_index ptr index)
    method object_at_indexed_subscript index = new mtl_vertex_buffer_layout_descriptor (mtl_vertex_buffer_layout_descriptor_array_object_at_indexed_subscript ptr index)
  end and mtl_vertex_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_blit_command_encoder (ptr: ObjC.id) = object (self)
    inherit mtl_command_encoder ptr
  end and mtl_buffer (ptr: ObjC.id) = object (self)
    inherit mtl_resource ptr
    method contents = mtl_buffer_contents ptr
    method did_modify_range range = mtl_buffer_did_modify_range ptr range
    method length = mtl_buffer_get_length ptr
    method remove_all_debug_markers = mtl_buffer_remove_all_debug_markers ptr
  end and mtl_command_buffer (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method render_command_encoder_with_descriptor (render_pass_descriptor : mtl_render_pass_descriptor) = new mtl_render_command_encoder (mtl_command_buffer_render_command_encoder_with_descriptor ptr render_pass_descriptor#get_id)
    method compute_command_encoder = new mtl_compute_command_encoder (mtl_command_buffer_compute_command_encoder ptr)
    method blit_command_encoder = new mtl_blit_command_encoder (mtl_command_buffer_blit_command_encoder ptr)
    method parallel_render_command_encoder_with_descriptor (render_pass_descriptor : mtl_render_pass_descriptor) = new mtl_parallel_render_command_encoder (mtl_command_buffer_parallel_render_command_encoder_with_descriptor ptr render_pass_descriptor#get_id)
    method enqueue = mtl_command_buffer_enqueue ptr
    method commit = mtl_command_buffer_commit ptr
    method present_drawable (drawable : mtl_drawable) = mtl_command_buffer_present_drawable ptr drawable#get_id
    method wait_until_scheduled = mtl_command_buffer_wait_until_scheduled ptr
    method wait_until_completed = mtl_command_buffer_wait_until_completed ptr
    method retained_references = mtl_command_buffer_get_retained_references ptr
    method device = new mtl_device (mtl_command_buffer_get_device ptr)
    method command_queue = new mtl_command_queue (mtl_command_buffer_get_command_queue ptr)
    method label = new ns_string (mtl_command_buffer_get_label ptr)
    method set_label (value : ns_string) = mtl_command_buffer_set_label ptr value#get_id
  end and mtl_command_queue (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method command_buffer = new mtl_command_buffer (mtl_command_queue_command_buffer ptr)
    method command_buffer_with_unretained_references = new mtl_command_buffer (mtl_command_queue_command_buffer_with_unretained_references ptr)
    method insert_debug_capture_boundary = mtl_command_queue_insert_debug_capture_boundary ptr
    method device = new mtl_device (mtl_command_queue_get_device ptr)
    method label = new ns_string (mtl_command_queue_get_label ptr)
    method set_label (value : ns_string) = mtl_command_queue_set_label ptr value#get_id
  end and mtl_compute_command_encoder (ptr: ObjC.id) = object (self)
    inherit mtl_command_encoder ptr
  end and mtl_compute_pipeline_state (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_depth_stencil_state (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_device (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method depth24_stencil8_pixel_format_supported = mtl_device_get_depth24_stencil8_pixel_format_supported ptr
    method headless = mtl_device_get_headless ptr
    method low_power = mtl_device_get_low_power ptr
    method max_threads_per_threadgroup = mtl_device_get_max_threads_per_threadgroup ptr
    method recommended_max_working_set_size = mtl_device_get_recommended_max_working_set_size ptr
    method name = new ns_string (mtl_device_get_name ptr)
    method supports_feature_set feature_set = mtl_device_supports_feature_set ptr feature_set
    method supports_texture_sample_count sample_count = mtl_device_supports_texture_sample_count ptr sample_count
    method new_default_library = mtl_device_new_default_library ptr
    method new_library_with_file_error (filepath : ns_string) (error : ObjC.id ptr) = new mtl_library (mtl_device_new_library_with_file_error ptr filepath#get_id error)
    method new_command_queue = new mtl_command_queue (mtl_device_new_command_queue ptr)
    method new_command_queue_with_max_command_buffer_count max_command_buffer_count = new mtl_command_queue (mtl_device_new_command_queue_with_max_command_buffer_count ptr max_command_buffer_count)
    method new_buffer_with_length_options length options = new mtl_buffer (mtl_device_new_buffer_with_length_options ptr length options)
    method new_buffer_with_bytes_length_options pointer length options = new mtl_buffer (mtl_device_new_buffer_with_bytes_length_options ptr pointer length options)
    method new_texture_with_descriptor (descriptor : mtl_texture_descriptor) = new mtl_texture (mtl_device_new_texture_with_descriptor ptr descriptor#get_id)
    method new_heap_with_descriptor (descriptor : mtl_heap_descriptor) = new mtl_heap (mtl_device_new_heap_with_descriptor ptr descriptor#get_id)
    method heap_buffer_size_and_align_with_length_options length options = mtl_device_heap_buffer_size_and_align_with_length_options ptr length options
    method heap_texture_size_and_align_with_descriptor (desc : mtl_texture_descriptor) = mtl_device_heap_texture_size_and_align_with_descriptor ptr desc#get_id
    method new_fence = new mtl_fence (mtl_device_new_fence ptr)
    method new_sampler_state_with_descriptor (descriptor : mtl_sampler_descriptor) = new mtl_sampler_state (mtl_device_new_sampler_state_with_descriptor ptr descriptor#get_id)
    method new_render_pipeline_state_with_descriptor_error (descriptor : mtl_render_pipeline_descriptor) (error : ObjC.id ptr) = new mtl_render_pipeline_state (mtl_device_new_render_pipeline_state_with_descriptor_error ptr descriptor#get_id error)
    method new_depth_stencil_state_with_descriptor (descriptor : mtl_depth_stencil_descriptor) = new mtl_depth_stencil_state (mtl_device_new_depth_stencil_state_with_descriptor ptr descriptor#get_id)
  end and mtl_drawable (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method present = mtl_drawable_present ptr
  end and mtl_fence (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method device = new mtl_device (mtl_fence_get_device ptr)
    method label = new ns_string (mtl_fence_get_label ptr)
    method set_label (value : ns_string) = mtl_fence_set_label ptr value#get_id
  end and mtl_function (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_heap (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_library (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method new_function_with_name (function_name : ns_string) = new mtl_function (mtl_library_new_function_with_name ptr function_name#get_id)
    method function_names = new ns_array (mtl_library_get_function_names ptr)
    method device = new mtl_device (mtl_library_get_device ptr)
    method label = new ns_string (mtl_library_get_label ptr)
    method set_label (value : ns_string) = mtl_library_set_label ptr value#get_id
  end and mtl_parallel_render_command_encoder (ptr: ObjC.id) = object (self)
    inherit mtl_command_encoder ptr
  end and mtl_render_command_encoder (ptr: ObjC.id) = object (self)
    inherit mtl_command_encoder ptr
    method set_blend_color_red_green_blue_alpha red green blue alpha = mtl_render_command_encoder_set_blend_color_red_green_blue_alpha ptr red green blue alpha
    method set_cull_mode cull_mode = mtl_render_command_encoder_set_cull_mode ptr cull_mode
    method set_depth_bias_slope_scale_clamp depth_bias slope_scale clamp = mtl_render_command_encoder_set_depth_bias_slope_scale_clamp ptr depth_bias slope_scale clamp
    method set_depth_clip_mode depth_clip_mode = mtl_render_command_encoder_set_depth_clip_mode ptr depth_clip_mode
    method set_depth_stencil_state (depth_stencil_state : mtl_depth_stencil_state) = mtl_render_command_encoder_set_depth_stencil_state ptr depth_stencil_state#get_id
    method set_front_facing_winding front_facing_winding = mtl_render_command_encoder_set_front_facing_winding ptr front_facing_winding
    method set_render_pipeline_state (pipeline_state : mtl_render_pipeline_state) = mtl_render_command_encoder_set_render_pipeline_state ptr pipeline_state#get_id
    method set_scissor_rect rect = mtl_render_command_encoder_set_scissor_rect ptr rect
    method set_stencil_front_reference_value_back_reference_value front_reference_value back_reference_value = mtl_render_command_encoder_set_stencil_front_reference_value_back_reference_value ptr front_reference_value back_reference_value
    method set_stencil_reference_value reference_value = mtl_render_command_encoder_set_stencil_reference_value ptr reference_value
    method set_triangle_fill_mode fill_mode = mtl_render_command_encoder_set_triangle_fill_mode ptr fill_mode
    method set_viewport viewport = mtl_render_command_encoder_set_viewport ptr viewport
    method set_visibility_result_mode_offset mode offset = mtl_render_command_encoder_set_visibility_result_mode_offset ptr mode offset
    method set_vertex_buffer_offset_at_index (buffer : mtl_buffer) offset index = mtl_render_command_encoder_set_vertex_buffer_offset_at_index ptr buffer#get_id offset index
    method set_fragment_buffer_offset_at_index (buffer : mtl_buffer) offset index = mtl_render_command_encoder_set_fragment_buffer_offset_at_index ptr buffer#get_id offset index
    method set_fragment_sampler_state_at_index (sampler : mtl_sampler_state) index = mtl_render_command_encoder_set_fragment_sampler_state_at_index ptr sampler#get_id index
    method set_fragment_texture_at_index (texture : mtl_texture) index = mtl_render_command_encoder_set_fragment_texture_at_index ptr texture#get_id index
    method draw_primitives_vertex_start_vertex_count primitive_type vertex_start vertex_count = mtl_render_command_encoder_draw_primitives_vertex_start_vertex_count ptr primitive_type vertex_start vertex_count
    method draw_indexed_primitives_index_count_index_type_index_buffer_index_buffer_offset primitive_type index_count index_type (index_buffer : mtl_buffer) index_buffer_offset = mtl_render_command_encoder_draw_indexed_primitives_index_count_index_type_index_buffer_index_buffer_offset ptr primitive_type index_count index_type index_buffer#get_id index_buffer_offset
  end and mtl_render_pipeline_state (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_sampler_state (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mtl_texture (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method replace_region_mipmap_level_slice_with_bytes_bytes_per_row_bytes_per_image region level slice pixel_bytes bytes_per_row bytes_per_image = mtl_texture_replace_region_mipmap_level_slice_with_bytes_bytes_per_row_bytes_per_image ptr region level slice pixel_bytes bytes_per_row bytes_per_image
    method replace_region_mipmap_level_with_bytes_bytes_per_row region level pixel_bytes bytes_per_row = mtl_texture_replace_region_mipmap_level_with_bytes_bytes_per_row ptr region level pixel_bytes bytes_per_row
    method texture_type = mtl_texture_get_texture_type ptr
    method pixel_format = mtl_texture_get_pixel_format ptr
    method width = mtl_texture_get_width ptr
    method height = mtl_texture_get_height ptr
    method depth = mtl_texture_get_depth ptr
    method mipmap_level_count = mtl_texture_get_mipmap_level_count ptr
    method array_length = mtl_texture_get_array_length ptr
    method sample_count = mtl_texture_get_sample_count ptr
    method framebuffer_only = mtl_texture_get_framebuffer_only ptr
    method usage = mtl_texture_get_usage ptr
  end
end

open Implementation
open Implementation.Extern

module MTLArgumentAccess = struct
  let t = mtl_argument_access
end

module MTLArgumentType = struct
  let t = mtl_argument_type
end

module MTLAttributeFormat = struct
  let t = mtl_attribute_format
end

module MTLBlendFactor = struct
  let t = mtl_blend_factor
end

module MTLBlendOperation = struct
  let t = mtl_blend_operation
end

module MTLBlitOption = struct
  let t = mtl_blit_option
end

module MTLCPUCacheMode = struct
  let t = mtlcpu_cache_mode
end

module MTLColorWriteMask = struct
  let t = mtl_color_write_mask
end

module MTLCommandBufferError = struct
  let t = mtl_command_buffer_error
end

module MTLCommandBufferStatus = struct
  let t = mtl_command_buffer_status
end

module MTLCompareFunction = struct
  let t = mtl_compare_function
end

module MTLCullMode = struct
  let t = mtl_cull_mode
end

module MTLDepthClipMode = struct
  let t = mtl_depth_clip_mode
end

module MTLFeatureSet = struct
  let t = mtl_feature_set
end

module MTLFunctionType = struct
  let t = mtl_function_type
end

module MTLIndexType = struct
  let t = mtl_index_type
end

module MTLLanguageVersion = struct
  let t = mtl_language_version
end

module MTLLibraryError = struct
  let t = mtl_library_error
end

module MTLLoadAction = struct
  let t = mtl_load_action
end

module MTLMultisampleDepthResolveFilter = struct
  let t = mtl_multisample_depth_resolve_filter
end

module MTLPatchType = struct
  let t = mtl_patch_type
end

module MTLPipelineOption = struct
  let t = mtl_pipeline_option
end

module MTLPixelFormat = struct
  let t = mtl_pixel_format
end

module MTLPrimitiveTopologyClass = struct
  let t = mtl_primitive_topology_class
end

module MTLPrimitiveType = struct
  let t = mtl_primitive_type
end

module MTLPurgeableState = struct
  let t = mtl_purgeable_state
end

module MTLRenderPipelineError = struct
  let t = mtl_render_pipeline_error
end

module MTLRenderStages = struct
  let t = mtl_render_stages
end

module MTLResourceOptions = struct
  let t = mtl_resource_options
end

module MTLSamplerAddressMode = struct
  let t = mtl_sampler_address_mode
end

module MTLSamplerBorderColor = struct
  let t = mtl_sampler_border_color
end

module MTLSamplerMinMagFilter = struct
  let t = mtl_sampler_min_mag_filter
end

module MTLSamplerMipFilter = struct
  let t = mtl_sampler_mip_filter
end

module MTLStencilOperation = struct
  let t = mtl_stencil_operation
end

module MTLStepFunction = struct
  let t = mtl_step_function
end

module MTLStorageMode = struct
  let t = mtl_storage_mode
end

module MTLStoreAction = struct
  let t = mtl_store_action
end

module MTLTessellationControlPointIndexType = struct
  let t = mtl_tessellation_control_point_index_type
end

module MTLTessellationFactorFormat = struct
  let t = mtl_tessellation_factor_format
end

module MTLTessellationFactorStepFunction = struct
  let t = mtl_tessellation_factor_step_function
end

module MTLTessellationPartitionMode = struct
  let t = mtl_tessellation_partition_mode
end

module MTLTextureType = struct
  let t = mtl_texture_type
end

module MTLTextureUsage = struct
  let t = mtl_texture_usage
end

module MTLTriangleFillMode = struct
  let t = mtl_triangle_fill_mode
end

module MTLVertexFormat = struct
  let t = mtl_vertex_format
end

module MTLVertexStepFunction = struct
  let t = mtl_vertex_step_function
end

module MTLVisibilityResultMode = struct
  let t = mtl_visibility_result_mode
end

module MTLWinding = struct
  let t = mtl_winding
end

module MTLClearColor = struct
  type t = mtl_clear_color
  let t = mtl_clear_color
  let red = mtl_clear_color_red
  let green = mtl_clear_color_green
  let blue = mtl_clear_color_blue
  let alpha = mtl_clear_color_alpha

  let make red_v green_v blue_v alpha_v =
    let result = make t in
    setf result red red_v;
    setf result green green_v;
    setf result blue blue_v;
    setf result alpha alpha_v;
    result
end

module MTLDrawIndexedPrimitivesIndirectArguments = struct
  type t = mtl_draw_indexed_primitives_indirect_arguments
  let t = mtl_draw_indexed_primitives_indirect_arguments
  let index_count = mtl_draw_indexed_primitives_indirect_arguments_index_count
  let instance_count = mtl_draw_indexed_primitives_indirect_arguments_instance_count
  let index_start = mtl_draw_indexed_primitives_indirect_arguments_index_start
  let base_vertex = mtl_draw_indexed_primitives_indirect_arguments_base_vertex
  let base_instance = mtl_draw_indexed_primitives_indirect_arguments_base_instance

  let make index_count_v instance_count_v index_start_v base_vertex_v base_instance_v =
    let result = make t in
    setf result index_count index_count_v;
    setf result instance_count instance_count_v;
    setf result index_start index_start_v;
    setf result base_vertex base_vertex_v;
    setf result base_instance base_instance_v;
    result
end

module MTLDrawPatchIndirectArguments = struct
  type t = mtl_draw_patch_indirect_arguments
  let t = mtl_draw_patch_indirect_arguments
  let patch_count = mtl_draw_patch_indirect_arguments_patch_count
  let instance_count = mtl_draw_patch_indirect_arguments_instance_count
  let patch_start = mtl_draw_patch_indirect_arguments_patch_start
  let base_instance = mtl_draw_patch_indirect_arguments_base_instance

  let make patch_count_v instance_count_v patch_start_v base_instance_v =
    let result = make t in
    setf result patch_count patch_count_v;
    setf result instance_count instance_count_v;
    setf result patch_start patch_start_v;
    setf result base_instance base_instance_v;
    result
end

module MTLDrawPrimitivesIndirectArguments = struct
  type t = mtl_draw_primitives_indirect_arguments
  let t = mtl_draw_primitives_indirect_arguments
  let vertex_count = mtl_draw_primitives_indirect_arguments_vertex_count
  let instance_count = mtl_draw_primitives_indirect_arguments_instance_count
  let vertex_start = mtl_draw_primitives_indirect_arguments_vertex_start
  let base_instance = mtl_draw_primitives_indirect_arguments_base_instance

  let make vertex_count_v instance_count_v vertex_start_v base_instance_v =
    let result = make t in
    setf result vertex_count vertex_count_v;
    setf result instance_count instance_count_v;
    setf result vertex_start vertex_start_v;
    setf result base_instance base_instance_v;
    result
end

module MTLOrigin = struct
  type t = mtl_origin
  let t = mtl_origin
  let x = mtl_origin_x
  let y = mtl_origin_y
  let z = mtl_origin_z

  let make x_v y_v z_v =
    let result = make t in
    setf result x x_v;
    setf result y y_v;
    setf result z z_v;
    result
end

module MTLScissorRect = struct
  type t = mtl_scissor_rect
  let t = mtl_scissor_rect
  let x = mtl_scissor_rect_x
  let y = mtl_scissor_rect_y
  let width = mtl_scissor_rect_width
  let height = mtl_scissor_rect_height

  let make x_v y_v width_v height_v =
    let result = make t in
    setf result x x_v;
    setf result y y_v;
    setf result width width_v;
    setf result height height_v;
    result
end

module MTLSize = struct
  type t = mtl_size
  let t = mtl_size
  let width = mtl_size_width
  let height = mtl_size_height
  let depth = mtl_size_depth

  let make width_v height_v depth_v =
    let result = make t in
    setf result width width_v;
    setf result height height_v;
    setf result depth depth_v;
    result
end

module MTLSizeAndAlign = struct
  type t = mtl_size_and_align
  let t = mtl_size_and_align
  let size = mtl_size_and_align_size
  let align = mtl_size_and_align_align

  let make size_v align_v =
    let result = make t in
    setf result size size_v;
    setf result align align_v;
    result
end

module MTLRegion = struct
  type t = mtl_region
  let t = mtl_region
  let origin = mtl_region_origin
  let size = mtl_region_size

  let make origin_v size_v =
    let result = make t in
    setf result origin origin_v;
    setf result size size_v;
    result
end

module MTLViewport = struct
  type t = mtl_viewport
  let t = mtl_viewport
  let origin_x = mtl_viewport_origin_x
  let origin_y = mtl_viewport_origin_y
  let width = mtl_viewport_width
  let height = mtl_viewport_height
  let znear = mtl_viewport_znear
  let zfar = mtl_viewport_zfar

  let make origin_x_v origin_y_v width_v height_v znear_v zfar_v =
    let result = make t in
    setf result origin_x origin_x_v;
    setf result origin_y origin_y_v;
    setf result width width_v;
    setf result height height_v;
    setf result znear znear_v;
    setf result zfar zfar_v;
    result
end

module MTLCommandEncoder = struct
  class t = Implementation.mtl_command_encoder
end

module MTLResource = struct
  class t = Implementation.mtl_resource
end

module MTLArgument = struct
  class t = Implementation.mtl_argument
  let klass = mtl_argument_class

  let alloc () = new t (ObjC.alloc mtl_argument_class)
  let nil () = new t (ObjC.nil)
end

module MTLArrayType = struct
  class t = Implementation.mtl_array_type
  let klass = mtl_array_type_class

  let alloc () = new t (ObjC.alloc mtl_array_type_class)
  let nil () = new t (ObjC.nil)
end

module MTLAttribute = struct
  class t = Implementation.mtl_attribute
  let klass = mtl_attribute_class

  let alloc () = new t (ObjC.alloc mtl_attribute_class)
  let nil () = new t (ObjC.nil)
end

module MTLAttributeDescriptor = struct
  class t = Implementation.mtl_attribute_descriptor
  let klass = mtl_attribute_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_attribute_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLAttributeDescriptorArray = struct
  class t = Implementation.mtl_attribute_descriptor_array
  let klass = mtl_attribute_descriptor_array_class

  let alloc () = new t (ObjC.alloc mtl_attribute_descriptor_array_class)
  let nil () = new t (ObjC.nil)
end

module MTLBufferLayoutDescriptor = struct
  class t = Implementation.mtl_buffer_layout_descriptor
  let klass = mtl_buffer_layout_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_buffer_layout_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLBufferLayoutDescriptorArray = struct
  class t = Implementation.mtl_buffer_layout_descriptor_array
  let klass = mtl_buffer_layout_descriptor_array_class

  let alloc () = new t (ObjC.alloc mtl_buffer_layout_descriptor_array_class)
  let nil () = new t (ObjC.nil)
end

module MTLCompileOptions = struct
  class t = Implementation.mtl_compile_options
  let klass = mtl_compile_options_class

  let alloc () = new t (ObjC.alloc mtl_compile_options_class)
  let nil () = new t (ObjC.nil)
end

module MTLComputePipelineDescriptor = struct
  class t = Implementation.mtl_compute_pipeline_descriptor
  let klass = mtl_compute_pipeline_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_compute_pipeline_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLComputePipelineReflection = struct
  class t = Implementation.mtl_compute_pipeline_reflection
  let klass = mtl_compute_pipeline_reflection_class

  let alloc () = new t (ObjC.alloc mtl_compute_pipeline_reflection_class)
  let nil () = new t (ObjC.nil)
end

module MTLDepthStencilDescriptor = struct
  class t = Implementation.mtl_depth_stencil_descriptor
  let klass = mtl_depth_stencil_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_depth_stencil_descriptor_class)
  let nil () = new t (ObjC.nil)

  let depth_stencil_descriptor () = (alloc ())#init
end

module MTLFunctionConstant = struct
  class t = Implementation.mtl_function_constant
  let klass = mtl_function_constant_class

  let alloc () = new t (ObjC.alloc mtl_function_constant_class)
  let nil () = new t (ObjC.nil)
end

module MTLFunctionConstantValues = struct
  class t = Implementation.mtl_function_constant_values
  let klass = mtl_function_constant_values_class

  let alloc () = new t (ObjC.alloc mtl_function_constant_values_class)
  let nil () = new t (ObjC.nil)
end

module MTLHeapDescriptor = struct
  class t = Implementation.mtl_heap_descriptor
  let klass = mtl_heap_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_heap_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPassAttachmentDescriptor = struct
  class t = Implementation.mtl_render_pass_attachment_descriptor
  let klass = mtl_render_pass_attachment_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pass_attachment_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPassColorAttachmentDescriptor = struct
  class t = Implementation.mtl_render_pass_color_attachment_descriptor
  let klass = mtl_render_pass_color_attachment_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pass_color_attachment_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPassColorAttachmentDescriptorArray = struct
  class t = Implementation.mtl_render_pass_color_attachment_descriptor_array
  let klass = mtl_render_pass_color_attachment_descriptor_array_class

  let alloc () = new t (ObjC.alloc mtl_render_pass_color_attachment_descriptor_array_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPassDepthAttachmentDescriptor = struct
  class t = Implementation.mtl_render_pass_depth_attachment_descriptor
  let klass = mtl_render_pass_depth_attachment_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pass_depth_attachment_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPassDescriptor = struct
  class t = Implementation.mtl_render_pass_descriptor
  let klass = mtl_render_pass_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pass_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPassStencilAttachmentDescriptor = struct
  class t = Implementation.mtl_render_pass_stencil_attachment_descriptor
  let klass = mtl_render_pass_stencil_attachment_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pass_stencil_attachment_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPipelineColorAttachmentDescriptor = struct
  class t = Implementation.mtl_render_pipeline_color_attachment_descriptor
  let klass = mtl_render_pipeline_color_attachment_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pipeline_color_attachment_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPipelineColorAttachmentDescriptorArray = struct
  class t = Implementation.mtl_render_pipeline_color_attachment_descriptor_array
  let klass = mtl_render_pipeline_color_attachment_descriptor_array_class

  let alloc () = new t (ObjC.alloc mtl_render_pipeline_color_attachment_descriptor_array_class)
  let nil () = new t (ObjC.nil)
end

module MTLRenderPipelineDescriptor = struct
  class t = Implementation.mtl_render_pipeline_descriptor
  let klass = mtl_render_pipeline_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_render_pipeline_descriptor_class)
  let nil () = new t (ObjC.nil)

  let render_pipeline_descriptor () = (alloc ())#init
end

module MTLRenderPipelineReflection = struct
  class t = Implementation.mtl_render_pipeline_reflection
  let klass = mtl_render_pipeline_reflection_class

  let alloc () = new t (ObjC.alloc mtl_render_pipeline_reflection_class)
  let nil () = new t (ObjC.nil)
end

module MTLSamplerDescriptor = struct
  class t = Implementation.mtl_sampler_descriptor
  let klass = mtl_sampler_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_sampler_descriptor_class)
  let nil () = new t (ObjC.nil)

  let sampler_descriptor () = (alloc ())#init
end

module MTLStageInputOutputDescriptor = struct
  class t = Implementation.mtl_stage_input_output_descriptor
  let klass = mtl_stage_input_output_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_stage_input_output_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLStencilDescriptor = struct
  class t = Implementation.mtl_stencil_descriptor
  let klass = mtl_stencil_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_stencil_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLStructMember = struct
  class t = Implementation.mtl_struct_member
  let klass = mtl_struct_member_class

  let alloc () = new t (ObjC.alloc mtl_struct_member_class)
  let nil () = new t (ObjC.nil)
end

module MTLStructType = struct
  class t = Implementation.mtl_struct_type
  let klass = mtl_struct_type_class

  let alloc () = new t (ObjC.alloc mtl_struct_type_class)
  let nil () = new t (ObjC.nil)
end

module MTLTextureDescriptor = struct
  class t = Implementation.mtl_texture_descriptor
  let klass = mtl_texture_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_texture_descriptor_class)
  let nil () = new t (ObjC.nil)

  let texture_descriptor () = (alloc ())#init
end

module MTLVertexAttribute = struct
  class t = Implementation.mtl_vertex_attribute
  let klass = mtl_vertex_attribute_class

  let alloc () = new t (ObjC.alloc mtl_vertex_attribute_class)
  let nil () = new t (ObjC.nil)
end

module MTLVertexAttributeDescriptor = struct
  class t = Implementation.mtl_vertex_attribute_descriptor
  let klass = mtl_vertex_attribute_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_vertex_attribute_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLVertexAttributeDescriptorArray = struct
  class t = Implementation.mtl_vertex_attribute_descriptor_array
  let klass = mtl_vertex_attribute_descriptor_array_class

  let alloc () = new t (ObjC.alloc mtl_vertex_attribute_descriptor_array_class)
  let nil () = new t (ObjC.nil)
end

module MTLVertexBufferLayoutDescriptor = struct
  class t = Implementation.mtl_vertex_buffer_layout_descriptor
  let klass = mtl_vertex_buffer_layout_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_vertex_buffer_layout_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLVertexBufferLayoutDescriptorArray = struct
  class t = Implementation.mtl_vertex_buffer_layout_descriptor_array
  let klass = mtl_vertex_buffer_layout_descriptor_array_class

  let alloc () = new t (ObjC.alloc mtl_vertex_buffer_layout_descriptor_array_class)
  let nil () = new t (ObjC.nil)
end

module MTLVertexDescriptor = struct
  class t = Implementation.mtl_vertex_descriptor
  let klass = mtl_vertex_descriptor_class

  let alloc () = new t (ObjC.alloc mtl_vertex_descriptor_class)
  let nil () = new t (ObjC.nil)
end

module MTLBlitCommandEncoder = struct
  class t = Implementation.mtl_blit_command_encoder
end

module MTLBuffer = struct
  class t = Implementation.mtl_buffer
end

module MTLCommandBuffer = struct
  class t = Implementation.mtl_command_buffer
end

module MTLCommandQueue = struct
  class t = Implementation.mtl_command_queue
end

module MTLComputeCommandEncoder = struct
  class t = Implementation.mtl_compute_command_encoder
end

module MTLComputePipelineState = struct
  class t = Implementation.mtl_compute_pipeline_state
end

module MTLDepthStencilState = struct
  class t = Implementation.mtl_depth_stencil_state
end

module MTLDevice = struct
  class t = Implementation.mtl_device
end

module MTLDrawable = struct
  class t = Implementation.mtl_drawable
end

module MTLFence = struct
  class t = Implementation.mtl_fence
end

module MTLFunction = struct
  class t = Implementation.mtl_function
end

module MTLHeap = struct
  class t = Implementation.mtl_heap
end

module MTLLibrary = struct
  class t = Implementation.mtl_library
end

module MTLParallelRenderCommandEncoder = struct
  class t = Implementation.mtl_parallel_render_command_encoder
end

module MTLRenderCommandEncoder = struct
  class t = Implementation.mtl_render_command_encoder
end

module MTLRenderPipelineState = struct
  class t = Implementation.mtl_render_pipeline_state
end

module MTLSamplerState = struct
  class t = Implementation.mtl_sampler_state
end

module MTLTexture = struct
  class t = Implementation.mtl_texture
end

let copy_all_devices () = new NSArray.t (mtl_copy_all_devices ())

let create_system_default_device () = new MTLDevice.t (mtl_create_system_default_device ())
