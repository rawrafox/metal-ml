open Ctypes
open Foundation
open Foundation.Implementation
open Foundation.Implementation.Extern

module Implementation = struct
  module Extern = struct
    type mdl_camera_projection = int
    let mdl_camera_projection = int

    type mdl_geometry_type = int
    let mdl_geometry_type = int

    type mdl_index_bit_depth = int
    let mdl_index_bit_depth = int

    type mdl_mesh_buffer_type = int
    let mdl_mesh_buffer_type = int

    type mdl_vertex_format = int
    let mdl_vertex_format = int
    let mdl_named_get_name = ObjC.message_send "name" (returning ObjC.id)
    let mdl_named_set_name = ObjC.message_send "setName:" (ObjC.id @-> returning void)

    let mdl_object_class = ObjC.get_class "MDLObject"

    let mdl_light_class = ObjC.get_class "MDLLight"

    let mdl_physically_plausible_light_class = ObjC.get_class "MDLPhysicallyPlausibleLight"

    let mdl_texture_class = ObjC.get_class "MDLTexture"

    let mdl_material_property_node_class = ObjC.get_class "MDLMaterialPropertyNode"
    let mdl_mesh_buffer_map = ObjC.message_send "map" (returning ObjC.id)
    let mdl_mesh_buffer_get_length = ObjC.message_send "length" (returning nsu_integer)
    let mdl_mesh_buffer_set_length = ObjC.message_send "setLength:" (nsu_integer @-> returning void)

    let mdl_scattering_function_class = ObjC.get_class "MDLScatteringFunction"

    let mdl_area_light_class = ObjC.get_class "MDLAreaLight"

    let mdl_asset_class = ObjC.get_class "MDLAsset"
    let mdl_asset_init = ObjC.message_send "init" (returning ObjC.id)
    let mdl_asset_init_with_url = ObjC.message_send "initWithURL:" (ObjC.id @-> returning ObjC.id)
    let mdl_asset_init_with_url_vertex_descriptor_buffer_allocator = ObjC.message_send "initWithURL:vertexDescriptor:bufferAllocator:" (ObjC.id @-> ObjC.id @-> ObjC.id @-> returning ObjC.id)
    let mdl_asset_export_asset_to_url = ObjC.message_send "exportAssetToURL:" (ObjC.id @-> returning bool)
    let mdl_asset_export_asset_to_url_error = ObjC.message_send "exportAssetToURL:error:" (ObjC.id @-> ptr ObjC.id @-> returning bool)
    let mdl_asset_get_count = ObjC.message_send "count" (returning nsu_integer)
    let mdl_asset_set_count = ObjC.message_send "setCount:" (nsu_integer @-> returning void)
    let mdl_asset_add_object = ObjC.message_send "addObject:" (ObjC.id @-> returning void)

    let mdl_camera_class = ObjC.get_class "MDLCamera"
    let mdl_camera_init = ObjC.message_send "init" (returning ObjC.id)
    let mdl_camera_get_world_to_meters_conversion_scale = ObjC.message_send "worldToMetersConversionScale" (returning float)
    let mdl_camera_set_world_to_meters_conversion_scale = ObjC.message_send "setWorldToMetersConversionScale:" (float @-> returning void)
    let mdl_camera_get_projection = ObjC.message_send "projection" (returning mdl_camera_projection)
    let mdl_camera_set_projection = ObjC.message_send "setProjection:" (mdl_camera_projection @-> returning void)

    let mdl_checkerboard_texture_class = ObjC.get_class "MDLCheckerboardTexture"

    let mdl_color_swatch_texture_class = ObjC.get_class "MDLColorSwatchTexture"

    let mdl_light_probe_class = ObjC.get_class "MDLLightProbe"

    let mdl_material_class = ObjC.get_class "MDLMaterial"

    let mdl_material_property_class = ObjC.get_class "MDLMaterialProperty"

    let mdl_material_property_connection_class = ObjC.get_class "MDLMaterialPropertyConnection"

    let mdl_material_property_graph_class = ObjC.get_class "MDLMaterialPropertyGraph"

    let mdl_mesh_class = ObjC.get_class "MDLMesh"
    let mdl_mesh_init_with_vertex_buffer_vertex_count_descriptor_submeshes = ObjC.message_send "initWithVertexBuffer:vertexCount:descriptor:submeshes:" (ObjC.id @-> nsu_integer @-> ObjC.id @-> ObjC.id @-> returning ObjC.id)
    let mdl_mesh_get_submeshes = ObjC.message_send "submeshes" (returning ObjC.id)
    let mdl_mesh_set_submeshes = ObjC.message_send "setSubmeshes:" (ObjC.id @-> returning void)
    let mdl_mesh_get_vertex_buffers = ObjC.message_send "vertexBuffers" (returning ObjC.id)
    let mdl_mesh_set_vertex_buffers = ObjC.message_send "setVertexBuffers:" (ObjC.id @-> returning void)
    let mdl_mesh_get_vertex_count = ObjC.message_send "vertexCount" (returning nsu_integer)
    let mdl_mesh_set_vertex_count = ObjC.message_send "setVertexCount:" (nsu_integer @-> returning void)
    let mdl_mesh_get_vertex_descriptor = ObjC.message_send "vertexDescriptor" (returning ObjC.id)
    let mdl_mesh_set_vertex_descriptor = ObjC.message_send "setVertexDescriptor:" (ObjC.id @-> returning void)

    let mdl_mesh_buffer_data_class = ObjC.get_class "MDLMeshBufferData"
    let mdl_mesh_buffer_data_init_with_type_data = ObjC.message_send "initWithType:data:" (mdl_mesh_buffer_type @-> ObjC.id @-> returning ObjC.id)
    let mdl_mesh_buffer_data_init_with_type_length = ObjC.message_send "initWithType:length:" (mdl_mesh_buffer_type @-> nsu_integer @-> returning ObjC.id)
    let mdl_mesh_buffer_data_get_data = ObjC.message_send "data" (returning ObjC.id)
    let mdl_mesh_buffer_data_set_data = ObjC.message_send "setData:" (ObjC.id @-> returning void)

    let mdl_mesh_buffer_data_allocator_class = ObjC.get_class "MDLMeshBufferDataAllocator"

    let mdl_mesh_buffer_map_class = ObjC.get_class "MDLMeshBufferMap"
    let mdl_mesh_buffer_map_get_bytes = ObjC.message_send "bytes" (returning (ptr void))
    let mdl_mesh_buffer_map_set_bytes = ObjC.message_send "setBytes:" ((ptr void) @-> returning void)

    let mdl_mesh_buffer_zone_default_class = ObjC.get_class "MDLMeshBufferZoneDefault"

    let mdl_noise_texture_class = ObjC.get_class "MDLNoiseTexture"

    let mdl_normal_map_texture_class = ObjC.get_class "MDLNormalMapTexture"

    let mdl_object_container_class = ObjC.get_class "MDLObjectContainer"

    let mdl_photometric_light_class = ObjC.get_class "MDLPhotometricLight"

    let mdl_physically_plausible_scattering_function_class = ObjC.get_class "MDLPhysicallyPlausibleScatteringFunction"

    let mdl_sky_cube_texture_class = ObjC.get_class "MDLSkyCubeTexture"

    let mdl_stereoscopic_camera_class = ObjC.get_class "MDLStereoscopicCamera"

    let mdl_submesh_class = ObjC.get_class "MDLSubmesh"
    let mdl_submesh_init_with_index_buffer_index_count_index_type_geometry_type_material = ObjC.message_send "initWithIndexBuffer:indexCount:indexType:geometryType:material:" (ObjC.id @-> nsu_integer @-> mdl_index_bit_depth @-> mdl_geometry_type @-> ObjC.id @-> returning ObjC.id)
    let mdl_submesh_get_index_buffer = ObjC.message_send "indexBuffer" (returning ObjC.id)
    let mdl_submesh_set_index_buffer = ObjC.message_send "setIndexBuffer:" (ObjC.id @-> returning void)
    let mdl_submesh_get_index_count = ObjC.message_send "indexCount" (returning nsu_integer)
    let mdl_submesh_set_index_count = ObjC.message_send "setIndexCount:" (nsu_integer @-> returning void)
    let mdl_submesh_get_index_type = ObjC.message_send "indexType" (returning mdl_index_bit_depth)
    let mdl_submesh_set_index_type = ObjC.message_send "setIndexType:" (mdl_index_bit_depth @-> returning void)
    let mdl_submesh_get_geometry_type = ObjC.message_send "geometryType" (returning mdl_geometry_type)
    let mdl_submesh_set_geometry_type = ObjC.message_send "setGeometryType:" (mdl_geometry_type @-> returning void)
    let mdl_submesh_get_topology = ObjC.message_send "topology" (returning ObjC.id)
    let mdl_submesh_set_topology = ObjC.message_send "setTopology:" (ObjC.id @-> returning void)
    let mdl_submesh_get_material = ObjC.message_send "material" (returning ObjC.id)
    let mdl_submesh_set_material = ObjC.message_send "setMaterial:" (ObjC.id @-> returning void)

    let mdl_submesh_topology_class = ObjC.get_class "MDLSubmeshTopology"

    let mdl_texture_filter_class = ObjC.get_class "MDLTextureFilter"

    let mdl_texture_sampler_class = ObjC.get_class "MDLTextureSampler"

    let mdl_transform_class = ObjC.get_class "MDLTransform"

    let mdlurl_texture_class = ObjC.get_class "MDLURLTexture"
    let mdlurl_texture_init_with_url_name = ObjC.message_send "initWithURL:name:" (ObjC.id @-> ObjC.id @-> returning ObjC.id)
    let mdlurl_texture_get_url = ObjC.message_send "URL" (returning ObjC.id)
    let mdlurl_texture_set_url = ObjC.message_send "setURL:" (ObjC.id @-> returning void)

    let mdl_vertex_attribute_class = ObjC.get_class "MDLVertexAttribute"
    let mdl_vertex_attribute_init_with_name_format_offset_buffer_index = ObjC.message_send "initWithName:format:offset:bufferIndex:" (ObjC.id @-> mdl_vertex_format @-> nsu_integer @-> nsu_integer @-> returning ObjC.id)
    let mdl_vertex_attribute_get_name = ObjC.message_send "name" (returning ObjC.id)
    let mdl_vertex_attribute_set_name = ObjC.message_send "setName:" (ObjC.id @-> returning void)
    let mdl_vertex_attribute_get_format = ObjC.message_send "format" (returning mdl_vertex_format)
    let mdl_vertex_attribute_set_format = ObjC.message_send "setFormat:" (mdl_vertex_format @-> returning void)
    let mdl_vertex_attribute_get_offset = ObjC.message_send "offset" (returning nsu_integer)
    let mdl_vertex_attribute_set_offset = ObjC.message_send "setOffset:" (nsu_integer @-> returning void)
    let mdl_vertex_attribute_get_buffer_index = ObjC.message_send "bufferIndex" (returning nsu_integer)
    let mdl_vertex_attribute_set_buffer_index = ObjC.message_send "setBufferIndex:" (nsu_integer @-> returning void)

    let mdl_vertex_attribute_data_class = ObjC.get_class "MDLVertexAttributeData"

    let mdl_vertex_buffer_layout_class = ObjC.get_class "MDLVertexBufferLayout"
    let mdl_vertex_buffer_layout_get_stride = ObjC.message_send "stride" (returning nsu_integer)
    let mdl_vertex_buffer_layout_set_stride = ObjC.message_send "setStride:" (nsu_integer @-> returning void)
    let mdl_vertex_buffer_layout_init_with_stride = ObjC.message_send "initWithStride:" (nsu_integer @-> returning ObjC.id)

    let mdl_vertex_descriptor_class = ObjC.get_class "MDLVertexDescriptor"
    let mdl_vertex_descriptor_init = ObjC.message_send "init" (returning ObjC.id)
    let mdl_vertex_descriptor_get_attributes = ObjC.message_send "attributes" (returning ObjC.id)
    let mdl_vertex_descriptor_set_attributes = ObjC.message_send "setAttributes:" (ObjC.id @-> returning void)
    let mdl_vertex_descriptor_attribute_named = ObjC.message_send "attributeNamed:" (ObjC.id @-> returning void)
    let mdl_vertex_descriptor_add_or_replace_attribute = ObjC.message_send "addOrReplaceAttribute:" (ObjC.id @-> returning void)
    let mdl_vertex_descriptor_set_packed_offsets = ObjC.message_send "setPackedOffsets" (returning void)
    let mdl_vertex_descriptor_get_layouts = ObjC.message_send "layouts" (returning ObjC.id)
    let mdl_vertex_descriptor_set_layouts = ObjC.message_send "setLayouts:" (ObjC.id @-> returning void)
    let mdl_vertex_descriptor_set_packed_strides = ObjC.message_send "setPackedStrides" (returning void)
    let mdl_vertex_descriptor_reset = ObjC.message_send "reset" (returning void)
    let mdl_vertex_descriptor_init_with_vertex_descriptor = ObjC.message_send "initWithVertexDescriptor:" (ObjC.id @-> returning ObjC.id)
    let mdl_vertex_descriptor_remove_attribute_named = ObjC.message_send "removeAttributeNamed:" (ObjC.id @-> returning void)

    let mdl_voxel_array_class = ObjC.get_class "MDLVoxelArray"
  end

  open Extern

  class mdl_named (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method name = new ns_string (mdl_named_get_name ptr)
    method set_name (value : ns_string) = mdl_named_set_name ptr value#get_id
  end and mdl_object (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_light (ptr: ObjC.id) = object (self)
    inherit mdl_object ptr
  end and mdl_physically_plausible_light (ptr: ObjC.id) = object (self)
    inherit mdl_light ptr
  end and mdl_texture (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_material_property_node (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_mesh_buffer (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method map = new mdl_mesh_buffer_map (mdl_mesh_buffer_map ptr)
    method length = mdl_mesh_buffer_get_length ptr
    method set_length value = mdl_mesh_buffer_set_length ptr value
  end and mdl_mesh_buffer_allocator (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_mesh_buffer_zone (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_scattering_function (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_area_light (ptr: ObjC.id) = object (self)
    inherit mdl_physically_plausible_light ptr
  end and mdl_asset (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new mdl_asset (mdl_asset_init ptr)
    method init_with_url (url : nsurl) = new mdl_asset (mdl_asset_init_with_url ptr url#get_id)
    method init_with_url_vertex_descriptor_buffer_allocator (url : nsurl) (vertex_descriptor : mdl_vertex_descriptor) (buffer_allocator : mdl_mesh_buffer_allocator) = new mdl_asset (mdl_asset_init_with_url_vertex_descriptor_buffer_allocator ptr url#get_id vertex_descriptor#get_id buffer_allocator#get_id)
    method export_asset_to_url (url : nsurl) = mdl_asset_export_asset_to_url ptr url#get_id
    method export_asset_to_url_error (url : nsurl) (error : ObjC.id ptr) = mdl_asset_export_asset_to_url_error ptr url#get_id error
    method count = mdl_asset_get_count ptr
    method add_object (obj : mdl_object) = mdl_asset_add_object ptr obj#get_id
  end and mdl_camera (ptr: ObjC.id) = object (self)
    inherit mdl_object ptr
    method init = new mdl_camera (mdl_camera_init ptr)
    method world_to_meters_conversion_scale = mdl_camera_get_world_to_meters_conversion_scale ptr
    method set_world_to_meters_conversion_scale value = mdl_camera_set_world_to_meters_conversion_scale ptr value
    method projection = mdl_camera_get_projection ptr
    method set_projection value = mdl_camera_set_projection ptr value
  end and mdl_checkerboard_texture (ptr: ObjC.id) = object (self)
    inherit mdl_texture ptr
  end and mdl_color_swatch_texture (ptr: ObjC.id) = object (self)
    inherit mdl_texture ptr
  end and mdl_light_probe (ptr: ObjC.id) = object (self)
    inherit mdl_light ptr
  end and mdl_material (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_material_property (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_material_property_connection (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
  end and mdl_material_property_graph (ptr: ObjC.id) = object (self)
    inherit mdl_material_property_node ptr
  end and mdl_mesh (ptr: ObjC.id) = object (self)
    inherit mdl_object ptr
    method init_with_vertex_buffer_vertex_count_descriptor_submeshes (vertex_buffer : mdl_mesh_buffer) vertex_count (descriptor : mdl_vertex_descriptor) (submeshes : ns_array) = new mdl_mesh (mdl_mesh_init_with_vertex_buffer_vertex_count_descriptor_submeshes ptr vertex_buffer#get_id vertex_count descriptor#get_id submeshes#get_id)
    method submeshes = new ns_mutable_array (mdl_mesh_get_submeshes ptr)
    method set_submeshes (value : ns_mutable_array) = mdl_mesh_set_submeshes ptr value#get_id
    method vertex_buffers = new ns_array (mdl_mesh_get_vertex_buffers ptr)
    method set_vertex_buffers (value : ns_array) = mdl_mesh_set_vertex_buffers ptr value#get_id
    method vertex_count = mdl_mesh_get_vertex_count ptr
    method set_vertex_count value = mdl_mesh_set_vertex_count ptr value
    method vertex_descriptor = new mdl_vertex_descriptor (mdl_mesh_get_vertex_descriptor ptr)
    method set_vertex_descriptor (value : mdl_vertex_descriptor) = mdl_mesh_set_vertex_descriptor ptr value#get_id
  end and mdl_mesh_buffer_data (ptr: ObjC.id) = object (self)
    inherit mdl_mesh_buffer ptr
    method init_with_type_data buffer_type (data : ns_data) = new mdl_mesh_buffer_data (mdl_mesh_buffer_data_init_with_type_data ptr buffer_type data#get_id)
    method init_with_type_length buffer_type length = new mdl_mesh_buffer_data (mdl_mesh_buffer_data_init_with_type_length ptr buffer_type length)
    method data = new ns_data (mdl_mesh_buffer_data_get_data ptr)
  end and mdl_mesh_buffer_data_allocator (ptr: ObjC.id) = object (self)
    inherit mdl_mesh_buffer_allocator ptr
  end and mdl_mesh_buffer_map (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method bytes = mdl_mesh_buffer_map_get_bytes ptr
  end and mdl_mesh_buffer_zone_default (ptr: ObjC.id) = object (self)
    inherit mdl_mesh_buffer_zone ptr
  end and mdl_noise_texture (ptr: ObjC.id) = object (self)
    inherit mdl_texture ptr
  end and mdl_normal_map_texture (ptr: ObjC.id) = object (self)
    inherit mdl_texture ptr
  end and mdl_object_container (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_photometric_light (ptr: ObjC.id) = object (self)
    inherit mdl_physically_plausible_light ptr
  end and mdl_physically_plausible_scattering_function (ptr: ObjC.id) = object (self)
    inherit mdl_scattering_function ptr
  end and mdl_sky_cube_texture (ptr: ObjC.id) = object (self)
    inherit mdl_texture ptr
  end and mdl_stereoscopic_camera (ptr: ObjC.id) = object (self)
    inherit mdl_camera ptr
  end and mdl_submesh (ptr: ObjC.id) = object (self)
    inherit mdl_named ptr
    method init_with_index_buffer_index_count_index_type_geometry_type_material (index_buffer : mdl_mesh_buffer) index_count index_type geometry_type (material : mdl_material) = new mdl_submesh (mdl_submesh_init_with_index_buffer_index_count_index_type_geometry_type_material ptr index_buffer#get_id index_count index_type geometry_type material#get_id)
    method index_buffer = new mdl_mesh_buffer (mdl_submesh_get_index_buffer ptr)
    method index_count = mdl_submesh_get_index_count ptr
    method index_type = mdl_submesh_get_index_type ptr
    method geometry_type = mdl_submesh_get_geometry_type ptr
    method topology = new mdl_submesh_topology (mdl_submesh_get_topology ptr)
    method set_topology (value : mdl_submesh_topology) = mdl_submesh_set_topology ptr value#get_id
    method material = new mdl_material (mdl_submesh_get_material ptr)
    method set_material (value : mdl_material) = mdl_submesh_set_material ptr value#get_id
  end and mdl_submesh_topology (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_texture_filter (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_texture_sampler (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_transform (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdlurl_texture (ptr: ObjC.id) = object (self)
    inherit mdl_texture ptr
    method init_with_url_name (url : nsurl) (name : ns_string) = new mdlurl_texture (mdlurl_texture_init_with_url_name ptr url#get_id name#get_id)
    method url = new nsurl (mdlurl_texture_get_url ptr)
    method set_url (value : nsurl) = mdlurl_texture_set_url ptr value#get_id
  end and mdl_vertex_attribute (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init_with_name_format_offset_buffer_index (name : ns_string) format offset buffer_index = new mdl_vertex_attribute (mdl_vertex_attribute_init_with_name_format_offset_buffer_index ptr name#get_id format offset buffer_index)
    method name = new ns_string (mdl_vertex_attribute_get_name ptr)
    method set_name (value : ns_string) = mdl_vertex_attribute_set_name ptr value#get_id
    method format = mdl_vertex_attribute_get_format ptr
    method set_format value = mdl_vertex_attribute_set_format ptr value
    method offset = mdl_vertex_attribute_get_offset ptr
    method set_offset value = mdl_vertex_attribute_set_offset ptr value
    method buffer_index = mdl_vertex_attribute_get_buffer_index ptr
    method set_buffer_index value = mdl_vertex_attribute_set_buffer_index ptr value
  end and mdl_vertex_attribute_data (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_vertex_buffer_layout (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method stride = mdl_vertex_buffer_layout_get_stride ptr
    method set_stride value = mdl_vertex_buffer_layout_set_stride ptr value
    method init_with_stride stride = new mdl_vertex_buffer_layout (mdl_vertex_buffer_layout_init_with_stride ptr stride)
  end and mdl_vertex_descriptor (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new mdl_vertex_descriptor (mdl_vertex_descriptor_init ptr)
    method attributes = new ns_mutable_array (mdl_vertex_descriptor_get_attributes ptr)
    method set_attributes (value : ns_mutable_array) = mdl_vertex_descriptor_set_attributes ptr value#get_id
    method attribute_named (name : ns_string) = mdl_vertex_descriptor_attribute_named ptr name#get_id
    method add_or_replace_attribute (attribute : mdl_vertex_attribute) = mdl_vertex_descriptor_add_or_replace_attribute ptr attribute#get_id
    method set_packed_offsets = mdl_vertex_descriptor_set_packed_offsets ptr
    method layouts = new ns_mutable_array (mdl_vertex_descriptor_get_layouts ptr)
    method set_layouts (value : ns_mutable_array) = mdl_vertex_descriptor_set_layouts ptr value#get_id
    method set_packed_strides = mdl_vertex_descriptor_set_packed_strides ptr
    method reset = mdl_vertex_descriptor_reset ptr
    method init_with_vertex_descriptor (vertex_descriptor : mdl_vertex_descriptor) = new mdl_vertex_descriptor (mdl_vertex_descriptor_init_with_vertex_descriptor ptr vertex_descriptor#get_id)
    method remove_attribute_named (attribute : mdl_vertex_attribute) = mdl_vertex_descriptor_remove_attribute_named ptr attribute#get_id
  end and mdl_voxel_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_component (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_light_probe_irradiance_data_source (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_object_container_component (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and mdl_transform_component (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end
end

open Implementation
open Implementation.Extern

module MDLCameraProjection = struct
  let t = mdl_camera_projection
end

module MDLGeometryType = struct
  let t = mdl_geometry_type
end

module MDLIndexBitDepth = struct
  let t = mdl_index_bit_depth
end

module MDLMeshBufferType = struct
  let t = mdl_mesh_buffer_type
end

module MDLVertexFormat = struct
  let t = mdl_vertex_format
end

module MDLNamed = struct
  class t = Implementation.mdl_named
end

module MDLObject = struct
  class t = Implementation.mdl_object
  let klass = mdl_object_class

  let alloc () = new t (ObjC.alloc mdl_object_class)
  let nil () = new t (ObjC.nil)
end

module MDLLight = struct
  class t = Implementation.mdl_light
  let klass = mdl_light_class

  let alloc () = new t (ObjC.alloc mdl_light_class)
  let nil () = new t (ObjC.nil)
end

module MDLPhysicallyPlausibleLight = struct
  class t = Implementation.mdl_physically_plausible_light
  let klass = mdl_physically_plausible_light_class

  let alloc () = new t (ObjC.alloc mdl_physically_plausible_light_class)
  let nil () = new t (ObjC.nil)
end

module MDLTexture = struct
  class t = Implementation.mdl_texture
  let klass = mdl_texture_class

  let alloc () = new t (ObjC.alloc mdl_texture_class)
  let nil () = new t (ObjC.nil)
end

module MDLMaterialPropertyNode = struct
  class t = Implementation.mdl_material_property_node
  let klass = mdl_material_property_node_class

  let alloc () = new t (ObjC.alloc mdl_material_property_node_class)
  let nil () = new t (ObjC.nil)
end

module MDLMeshBuffer = struct
  class t = Implementation.mdl_mesh_buffer
end

module MDLMeshBufferAllocator = struct
  class t = Implementation.mdl_mesh_buffer_allocator
end

module MDLMeshBufferZone = struct
  class t = Implementation.mdl_mesh_buffer_zone
end

module MDLScatteringFunction = struct
  class t = Implementation.mdl_scattering_function
  let klass = mdl_scattering_function_class

  let alloc () = new t (ObjC.alloc mdl_scattering_function_class)
  let nil () = new t (ObjC.nil)
end

module MDLAreaLight = struct
  class t = Implementation.mdl_area_light
  let klass = mdl_area_light_class

  let alloc () = new t (ObjC.alloc mdl_area_light_class)
  let nil () = new t (ObjC.nil)
end

module MDLAsset = struct
  class t = Implementation.mdl_asset
  let klass = mdl_asset_class

  let alloc () = new t (ObjC.alloc mdl_asset_class)
  let nil () = new t (ObjC.nil)

  let asset = (alloc ())#init
  let new_with_url url = (alloc ())#init_with_url url
  let new_with_url_vertex_descriptor_buffer_allocator url vertex_descriptor buffer_allocator = (alloc ())#init_with_url_vertex_descriptor_buffer_allocator url vertex_descriptor buffer_allocator
end

module MDLCamera = struct
  class t = Implementation.mdl_camera
  let klass = mdl_camera_class

  let alloc () = new t (ObjC.alloc mdl_camera_class)
  let nil () = new t (ObjC.nil)

  let camera = (alloc ())#init
end

module MDLCheckerboardTexture = struct
  class t = Implementation.mdl_checkerboard_texture
  let klass = mdl_checkerboard_texture_class

  let alloc () = new t (ObjC.alloc mdl_checkerboard_texture_class)
  let nil () = new t (ObjC.nil)
end

module MDLColorSwatchTexture = struct
  class t = Implementation.mdl_color_swatch_texture
  let klass = mdl_color_swatch_texture_class

  let alloc () = new t (ObjC.alloc mdl_color_swatch_texture_class)
  let nil () = new t (ObjC.nil)
end

module MDLLightProbe = struct
  class t = Implementation.mdl_light_probe
  let klass = mdl_light_probe_class

  let alloc () = new t (ObjC.alloc mdl_light_probe_class)
  let nil () = new t (ObjC.nil)
end

module MDLMaterial = struct
  class t = Implementation.mdl_material
  let klass = mdl_material_class

  let alloc () = new t (ObjC.alloc mdl_material_class)
  let nil () = new t (ObjC.nil)
end

module MDLMaterialProperty = struct
  class t = Implementation.mdl_material_property
  let klass = mdl_material_property_class

  let alloc () = new t (ObjC.alloc mdl_material_property_class)
  let nil () = new t (ObjC.nil)
end

module MDLMaterialPropertyConnection = struct
  class t = Implementation.mdl_material_property_connection
  let klass = mdl_material_property_connection_class

  let alloc () = new t (ObjC.alloc mdl_material_property_connection_class)
  let nil () = new t (ObjC.nil)
end

module MDLMaterialPropertyGraph = struct
  class t = Implementation.mdl_material_property_graph
  let klass = mdl_material_property_graph_class

  let alloc () = new t (ObjC.alloc mdl_material_property_graph_class)
  let nil () = new t (ObjC.nil)
end

module MDLMesh = struct
  class t = Implementation.mdl_mesh
  let klass = mdl_mesh_class

  let alloc () = new t (ObjC.alloc mdl_mesh_class)
  let nil () = new t (ObjC.nil)

  let new_with_vertex_buffer_vertex_count_descriptor_submeshes vertex_buffer vertex_count descriptor submeshes = (alloc ())#init_with_vertex_buffer_vertex_count_descriptor_submeshes vertex_buffer vertex_count descriptor submeshes
end

module MDLMeshBufferData = struct
  class t = Implementation.mdl_mesh_buffer_data
  let klass = mdl_mesh_buffer_data_class

  let alloc () = new t (ObjC.alloc mdl_mesh_buffer_data_class)
  let nil () = new t (ObjC.nil)

  let new_with_type_data buffer_type data = (alloc ())#init_with_type_data buffer_type data
  let new_with_type_length buffer_type length = (alloc ())#init_with_type_length buffer_type length
end

module MDLMeshBufferDataAllocator = struct
  class t = Implementation.mdl_mesh_buffer_data_allocator
  let klass = mdl_mesh_buffer_data_allocator_class

  let alloc () = new t (ObjC.alloc mdl_mesh_buffer_data_allocator_class)
  let nil () = new t (ObjC.nil)
end

module MDLMeshBufferMap = struct
  class t = Implementation.mdl_mesh_buffer_map
  let klass = mdl_mesh_buffer_map_class

  let alloc () = new t (ObjC.alloc mdl_mesh_buffer_map_class)
  let nil () = new t (ObjC.nil)
end

module MDLMeshBufferZoneDefault = struct
  class t = Implementation.mdl_mesh_buffer_zone_default
  let klass = mdl_mesh_buffer_zone_default_class

  let alloc () = new t (ObjC.alloc mdl_mesh_buffer_zone_default_class)
  let nil () = new t (ObjC.nil)
end

module MDLNoiseTexture = struct
  class t = Implementation.mdl_noise_texture
  let klass = mdl_noise_texture_class

  let alloc () = new t (ObjC.alloc mdl_noise_texture_class)
  let nil () = new t (ObjC.nil)
end

module MDLNormalMapTexture = struct
  class t = Implementation.mdl_normal_map_texture
  let klass = mdl_normal_map_texture_class

  let alloc () = new t (ObjC.alloc mdl_normal_map_texture_class)
  let nil () = new t (ObjC.nil)
end

module MDLObjectContainer = struct
  class t = Implementation.mdl_object_container
  let klass = mdl_object_container_class

  let alloc () = new t (ObjC.alloc mdl_object_container_class)
  let nil () = new t (ObjC.nil)
end

module MDLPhotometricLight = struct
  class t = Implementation.mdl_photometric_light
  let klass = mdl_photometric_light_class

  let alloc () = new t (ObjC.alloc mdl_photometric_light_class)
  let nil () = new t (ObjC.nil)
end

module MDLPhysicallyPlausibleScatteringFunction = struct
  class t = Implementation.mdl_physically_plausible_scattering_function
  let klass = mdl_physically_plausible_scattering_function_class

  let alloc () = new t (ObjC.alloc mdl_physically_plausible_scattering_function_class)
  let nil () = new t (ObjC.nil)
end

module MDLSkyCubeTexture = struct
  class t = Implementation.mdl_sky_cube_texture
  let klass = mdl_sky_cube_texture_class

  let alloc () = new t (ObjC.alloc mdl_sky_cube_texture_class)
  let nil () = new t (ObjC.nil)
end

module MDLStereoscopicCamera = struct
  class t = Implementation.mdl_stereoscopic_camera
  let klass = mdl_stereoscopic_camera_class

  let alloc () = new t (ObjC.alloc mdl_stereoscopic_camera_class)
  let nil () = new t (ObjC.nil)
end

module MDLSubmesh = struct
  class t = Implementation.mdl_submesh
  let klass = mdl_submesh_class

  let alloc () = new t (ObjC.alloc mdl_submesh_class)
  let nil () = new t (ObjC.nil)

  let new_with_index_buffer_index_count_index_type_geometry_type_material index_buffer index_count index_type geometry_type material = (alloc ())#init_with_index_buffer_index_count_index_type_geometry_type_material index_buffer index_count index_type geometry_type material
end

module MDLSubmeshTopology = struct
  class t = Implementation.mdl_submesh_topology
  let klass = mdl_submesh_topology_class

  let alloc () = new t (ObjC.alloc mdl_submesh_topology_class)
  let nil () = new t (ObjC.nil)
end

module MDLTextureFilter = struct
  class t = Implementation.mdl_texture_filter
  let klass = mdl_texture_filter_class

  let alloc () = new t (ObjC.alloc mdl_texture_filter_class)
  let nil () = new t (ObjC.nil)
end

module MDLTextureSampler = struct
  class t = Implementation.mdl_texture_sampler
  let klass = mdl_texture_sampler_class

  let alloc () = new t (ObjC.alloc mdl_texture_sampler_class)
  let nil () = new t (ObjC.nil)
end

module MDLTransform = struct
  class t = Implementation.mdl_transform
  let klass = mdl_transform_class

  let alloc () = new t (ObjC.alloc mdl_transform_class)
  let nil () = new t (ObjC.nil)
end

module MDLURLTexture = struct
  class t = Implementation.mdlurl_texture
  let klass = mdlurl_texture_class

  let alloc () = new t (ObjC.alloc mdlurl_texture_class)
  let nil () = new t (ObjC.nil)

  let new_with_url_name url name = (alloc ())#init_with_url_name url name
end

module MDLVertexAttribute = struct
  class t = Implementation.mdl_vertex_attribute
  let klass = mdl_vertex_attribute_class

  let alloc () = new t (ObjC.alloc mdl_vertex_attribute_class)
  let nil () = new t (ObjC.nil)

  let new_with_name_format_offset_buffer_index name format offset buffer_index = (alloc ())#init_with_name_format_offset_buffer_index name format offset buffer_index
end

module MDLVertexAttributeData = struct
  class t = Implementation.mdl_vertex_attribute_data
  let klass = mdl_vertex_attribute_data_class

  let alloc () = new t (ObjC.alloc mdl_vertex_attribute_data_class)
  let nil () = new t (ObjC.nil)
end

module MDLVertexBufferLayout = struct
  class t = Implementation.mdl_vertex_buffer_layout
  let klass = mdl_vertex_buffer_layout_class

  let alloc () = new t (ObjC.alloc mdl_vertex_buffer_layout_class)
  let nil () = new t (ObjC.nil)

  let new_with_stride stride = (alloc ())#init_with_stride stride
end

module MDLVertexDescriptor = struct
  class t = Implementation.mdl_vertex_descriptor
  let klass = mdl_vertex_descriptor_class

  let alloc () = new t (ObjC.alloc mdl_vertex_descriptor_class)
  let nil () = new t (ObjC.nil)

  let vertex_descriptor = (alloc ())#init
  let new_with_vertex_descriptor vertex_descriptor = (alloc ())#init_with_vertex_descriptor vertex_descriptor
end

module MDLVoxelArray = struct
  class t = Implementation.mdl_voxel_array
  let klass = mdl_voxel_array_class

  let alloc () = new t (ObjC.alloc mdl_voxel_array_class)
  let nil () = new t (ObjC.nil)
end

module MDLComponent = struct
  class t = Implementation.mdl_component
end

module MDLLightProbeIrradianceDataSource = struct
  class t = Implementation.mdl_light_probe_irradiance_data_source
end

module MDLObjectContainerComponent = struct
  class t = Implementation.mdl_object_container_component
end

module MDLTransformComponent = struct
  class t = Implementation.mdl_transform_component
end
