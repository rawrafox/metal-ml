open Ctypes
open Objc
open Foundation
open Cocoa
open Metal

let init_with_frame_device = message_send "initWithFrame:device:" (cg_rect @-> id @-> returning id)

let device = message_send "device" (returning id)

let set_color_pixel_format = message_send "setColorPixelFormat:" (int @-> returning void)
let set_clear_color = message_send "setClearColor:" (mtl_clear_color @-> returning void)

let current_drawable = message_send "currentDrawable" (returning id)
let current_render_pass_descriptor = message_send "currentRenderPassDescriptor" (returning id)

class mtk_view (ptr:id) = object (self)
  inherit ns_view ptr as super

  method init_with_frame_device (frame:cg_rect Ctypes.structure) (device:mtl_device) = new mtk_view (init_with_frame_device ptr frame device#get_id)

  method device = new mtl_device (device ptr)

  method set_color_pixel_format (pixel_format:int) = set_color_pixel_format ptr pixel_format
  method set_clear_color (clear_color:mtl_clear_color Ctypes.structure) = set_clear_color ptr clear_color

  method current_drawable = new mtl_drawable (current_drawable ptr)
  method current_render_pass_descriptor = new mtl_render_pass_descriptor (current_render_pass_descriptor ptr)
end
