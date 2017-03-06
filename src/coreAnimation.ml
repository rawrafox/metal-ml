open Ctypes
open Foundation
open Foundation.Implementation
open Foundation.Implementation.Extern
open Metal
open Metal.Implementation
open Metal.Implementation.Extern

module Implementation = struct
  module Extern = struct
  end

  open Extern

  class ca_metal_drawable (ptr: ObjC.id) = object (self)
    inherit mtl_drawable ptr
  end
end

open Implementation
open Implementation.Extern

module CAMetalDrawable = struct
  class t = Implementation.ca_metal_drawable
end
