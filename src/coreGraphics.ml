open Ctypes

module Implementation = struct
  module Extern = struct
    type cg_float = float typ
    let cg_float = double

    type cg_point_t
    type cg_point = cg_point_t structure
    let cg_point : cg_point typ = structure "CGPoint"
    let cg_point_x = field cg_point "x" cg_float
    let cg_point_y = field cg_point "y" cg_float
    let () = seal cg_point

    type cg_size_t
    type cg_size = cg_size_t structure
    let cg_size : cg_size typ = structure "CGSize"
    let cg_size_width = field cg_size "width" cg_float
    let cg_size_height = field cg_size "height" cg_float
    let () = seal cg_size

    type cg_rect_t
    type cg_rect = cg_rect_t structure
    let cg_rect : cg_rect typ = structure "CGRect"
    let cg_rect_origin = field cg_rect "origin" cg_point
    let cg_rect_size = field cg_rect "size" cg_size
    let () = seal cg_rect
  end

  open Extern
end

open Implementation
open Implementation.Extern

module CGFloat = struct
  let t = cg_float
end

module CGPoint = struct
  type t = cg_point
  let t = cg_point
  let x = cg_point_x
  let y = cg_point_y

  let make x_v y_v =
    let result = make t in
    setf result x x_v;
    setf result y y_v;
    result
end

module CGSize = struct
  type t = cg_size
  let t = cg_size
  let width = cg_size_width
  let height = cg_size_height

  let make width_v height_v =
    let result = make t in
    setf result width width_v;
    setf result height height_v;
    result
end

module CGRect = struct
  type t = cg_rect
  let t = cg_rect
  let origin = cg_rect_origin
  let size = cg_rect_size

  let make origin_v size_v =
    let result = make t in
    setf result origin origin_v;
    setf result size size_v;
    result
end
