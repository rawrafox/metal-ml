open Ctypes
open Foundation
open Foundation.Implementation
open Foundation.Implementation.Extern
open Cocoa
open Cocoa.Implementation
open Cocoa.Implementation.Extern
open MetalKit
open MetalKit.Implementation
open MetalKit.Implementation.Extern
open Self
open Self.Implementation
open Self.Implementation.Extern

module Implementation = struct
  module Extern = struct
    let rsm_view_class = ObjC.get_class "RSMView"

    let rsm_window_delegate_class = ObjC.get_class "RSMWindowDelegate"
    let rsm_window_delegate_init = ObjC.message_send "init" (returning ObjC.id)
  end

  open Extern

  class rsm_view (ptr: ObjC.id) = object (self)
    inherit mtk_view ptr
  
    inherit ns_view ptr
  
    inherit ns_object ptr
  end and rsm_window_delegate (ptr: ObjC.id) = object (self)
    inherit ns_window_delegate ptr
  
    inherit ns_object ptr
    method init = new rsm_window_delegate (rsm_window_delegate_init ptr)
  end
end

open Implementation
open Implementation.Extern

module RSMView = struct
  class t = Implementation.rsm_view
  let klass = rsm_view_class

  let alloc () = new t (ObjC.alloc rsm_view_class)
  let nil () = new t (ObjC.nil)
end

module RSMWindowDelegate = struct
  class t = Implementation.rsm_window_delegate
  let klass = rsm_window_delegate_class

  let alloc () = new t (ObjC.alloc rsm_window_delegate_class)
  let nil () = new t (ObjC.nil)

  let window_delegate = (alloc ())#init
end
