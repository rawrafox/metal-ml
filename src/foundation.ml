open Ctypes

module Implementation = struct
  module Extern = struct
    type ns_integer = Intptr.t
    let ns_integer = intptr_t

    type nsu_integer = Uintptr.t
    let nsu_integer = uintptr_t

    type ns_range_t
    type ns_range = ns_range_t structure
    let ns_range : ns_range typ = structure "NSRange"
    let ns_range_location = field ns_range "location" nsu_integer
    let ns_range_length = field ns_range "length" nsu_integer
    let () = seal ns_range

    type ns_string_encoding = int
    let ns_string_encoding = int

    let ns_object_class = ObjC.get_class "NSObject"
    let ns_object_is_equal = ObjC.message_send "isEqual:" (ObjC.id @-> returning bool)
    let ns_object_get_hash = ObjC.message_send "hash" (returning nsu_integer)
    let ns_object_set_hash = ObjC.message_send "setHash:" (nsu_integer @-> returning void)
    let ns_object_get_description = ObjC.message_send "description" (returning ObjC.id)
    let ns_object_set_description = ObjC.message_send "setDescription:" (ObjC.id @-> returning void)
    let ns_object_get_debug_description = ObjC.message_send "debugDescription" (returning ObjC.id)
    let ns_object_set_debug_description = ObjC.message_send "setDebugDescription:" (ObjC.id @-> returning void)
    let ns_object_is_proxy = ObjC.message_send "isProxy" (returning bool)

    let ns_array_class = ObjC.get_class "NSArray"
    let ns_array_init = ObjC.message_send "init" (returning ObjC.id)
    let ns_array_get_count = ObjC.message_send "count" (returning nsu_integer)
    let ns_array_set_count = ObjC.message_send "setCount:" (nsu_integer @-> returning void)

    let ns_data_class = ObjC.get_class "NSData"
    let ns_data_init_with_bytes_length = ObjC.message_send "initWithBytes:length:" ((ptr void) @-> nsu_integer @-> returning ObjC.id)
    let ns_data_subdata_with_range = ObjC.message_send "subdataWithRange:" (ns_range @-> returning ObjC.id)

    let ns_dictionary_class = ObjC.get_class "NSDictionary"
    let ns_dictionary_init = ObjC.message_send "init" (returning ObjC.id)

    let ns_error_class = ObjC.get_class "NSError"

    let ns_mutable_array_class = ObjC.get_class "NSMutableArray"
    let ns_mutable_array_insert_object_at_index = ObjC.message_send "insertObject:atIndex:" (ObjC.id @-> nsu_integer @-> returning void)

    let ns_string_class = ObjC.get_class "NSString"
    let ns_string_init = ObjC.message_send "init" (returning ObjC.id)
    let ns_string_init_with_bytes_length_encoding = ObjC.message_send "initWithBytes:length:encoding:" ((ptr void) @-> nsu_integer @-> ns_string_encoding @-> returning ObjC.id)
    let ns_string_init_with_utf8_string = ObjC.message_send "initWithUTF8String:" (string @-> returning ObjC.id)
    let ns_string_get_length = ObjC.message_send "length" (returning nsu_integer)
    let ns_string_set_length = ObjC.message_send "setLength:" (nsu_integer @-> returning void)
    let ns_string_length_of_bytes_using_encoding = ObjC.message_send "lengthOfBytesUsingEncoding:" (ns_string_encoding @-> returning nsu_integer)
    let ns_string_maximum_length_of_bytes_using_encoding = ObjC.message_send "maximumLengthOfBytesUsingEncoding:" (ns_string_encoding @-> returning nsu_integer)
    let ns_string_get_c_string_using_encoding = ObjC.message_send "getCStringUsing:encoding:" (ns_string_encoding @-> returning string)
    let ns_string_get_c_string_max_length_encoding = ObjC.message_send "getCString:maxLength:encoding:" (string @-> nsu_integer @-> ns_string_encoding @-> returning bool)
    let ns_string_get_utf8_string = ObjC.message_send "UTF8String" (returning string)
    let ns_string_set_utf8_string = ObjC.message_send "setUTF8String:" (string @-> returning void)

    let nsurl_class = ObjC.get_class "NSURL"
    let nsurl_init_with_string = ObjC.message_send "initWithString:" (ObjC.id @-> returning ObjC.id)
  end

  open Extern

  class ns_object (ptr: ObjC.id) = object (self)
    inherit ObjC.Object.t ptr
    method is_equal (view : ns_object) = ns_object_is_equal ptr view#get_id
    method hash = ns_object_get_hash ptr
    method description = new ns_string (ns_object_get_description ptr)
    method debug_description = new ns_string (ns_object_get_debug_description ptr)
    method is_proxy = ns_object_is_proxy ptr
  end and ns_array (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new ns_array (ns_array_init ptr)
    method count = ns_array_get_count ptr
  end and ns_coder (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and ns_data (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init_with_bytes_length bytes length = new ns_data (ns_data_init_with_bytes_length ptr bytes length)
    method subdata_with_range range = new ns_data (ns_data_subdata_with_range ptr range)
  end and ns_dictionary (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new ns_dictionary (ns_dictionary_init ptr)
  end and ns_error (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
  end and ns_mutable_array (ptr: ObjC.id) = object (self)
    inherit ns_array ptr
    method insert_object_at_index (an_object : ns_object) index = ns_mutable_array_insert_object_at_index ptr an_object#get_id index
  end and ns_string (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init = new ns_string (ns_string_init ptr)
    method init_with_bytes_length_encoding bytes len encoding = new ns_string (ns_string_init_with_bytes_length_encoding ptr bytes len encoding)
    method init_with_utf8_string null_terminated_c_string = new ns_string (ns_string_init_with_utf8_string ptr null_terminated_c_string)
    method length = ns_string_get_length ptr
    method length_of_bytes_using_encoding enc = ns_string_length_of_bytes_using_encoding ptr enc
    method maximum_length_of_bytes_using_encoding enc = ns_string_maximum_length_of_bytes_using_encoding ptr enc
    method get_c_string_using_encoding encoding = ns_string_get_c_string_using_encoding ptr encoding
    method get_c_string_max_length_encoding buffer max_buffer_count encoding = ns_string_get_c_string_max_length_encoding ptr buffer max_buffer_count encoding
    method utf8_string = ns_string_get_utf8_string ptr
  end and nsurl (ptr: ObjC.id) = object (self)
    inherit ns_object ptr
    method init_with_string (url_string : ns_string) = new nsurl (nsurl_init_with_string ptr url_string#get_id)
  end
end

open Implementation
open Implementation.Extern

module NSInteger = struct
  let t = ns_integer
end

module NSUInteger = struct
  let t = nsu_integer
end

module NSRange = struct
  type t = ns_range
  let t = ns_range
  let location = ns_range_location
  let length = ns_range_length

  let make location_v length_v =
    let result = make t in
    setf result location location_v;
    setf result length length_v;
    result
end

module NSStringEncoding = struct
  let t = ns_string_encoding
end

module NSObject = struct
  class t = Implementation.ns_object
  let klass = ns_object_class

  let alloc () = new t (ObjC.alloc ns_object_class)
  let nil () = new t (ObjC.nil)
end

module NSArray = struct
  class t = Implementation.ns_array
  let klass = ns_array_class

  let alloc () = new t (ObjC.alloc ns_array_class)
  let nil () = new t (ObjC.nil)

  let array = (alloc ())#init
end

module NSCoder = struct
  class t = Implementation.ns_coder
end

module NSData = struct
  class t = Implementation.ns_data
  let klass = ns_data_class

  let alloc () = new t (ObjC.alloc ns_data_class)
  let nil () = new t (ObjC.nil)

  let new_with_bytes_length bytes length = (alloc ())#init_with_bytes_length bytes length
end

module NSDictionary = struct
  class t = Implementation.ns_dictionary
  let klass = ns_dictionary_class

  let alloc () = new t (ObjC.alloc ns_dictionary_class)
  let nil () = new t (ObjC.nil)

  let dictionary = (alloc ())#init
end

module NSError = struct
  class t = Implementation.ns_error
  let klass = ns_error_class

  let alloc () = new t (ObjC.alloc ns_error_class)
  let nil () = new t (ObjC.nil)
end

module NSMutableArray = struct
  class t = Implementation.ns_mutable_array
  let klass = ns_mutable_array_class

  let alloc () = new t (ObjC.alloc ns_mutable_array_class)
  let nil () = new t (ObjC.nil)
end

module NSString = struct
  class t = Implementation.ns_string
  let klass = ns_string_class

  let alloc () = new t (ObjC.alloc ns_string_class)
  let nil () = new t (ObjC.nil)

  let string = (alloc ())#init
  let new_with_bytes_length_encoding bytes len encoding = (alloc ())#init_with_bytes_length_encoding bytes len encoding
  let new_with_utf8_string null_terminated_c_string = (alloc ())#init_with_utf8_string null_terminated_c_string
end

module NSURL = struct
  class t = Implementation.nsurl
  let klass = nsurl_class

  let alloc () = new t (ObjC.alloc nsurl_class)
  let nil () = new t (ObjC.nil)

  let new_with_string url_string = (alloc ())#init_with_string url_string
end
