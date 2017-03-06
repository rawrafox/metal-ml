open Ctypes

module Implementation = struct
  module Extern = struct
    type cf_time_interval = float typ
    let cf_time_interval = double
  end

  open Extern
end

open Implementation
open Implementation.Extern

module CFTimeInterval = struct
  let t = cf_time_interval
end
