require 'ffi'
require 'parfaitrb/mmv/errno'

module ParfaitRb
  class MMV

    MMV_TYPE_NOSUPPORT = -1
    MMV_TYPE_I32       = 0
    MMV_TYPE_U32       = 1
    MMV_TYPE_I64       = 2
    MMV_TYPE_U64       = 3
    MMV_TYPE_FLOAT     = 4
    MMV_TYPE_DOUBLE    = 5
    MMV_TYPE_STRING    = 6
    MMV_TYPE_ELAPSED   = 9


    MMV_SEM_COUNTER    = 1
    MMV_SEM_INSTANT    = 3
    MMV_SEM_DISCRETE   = 4


    extend FFI::Library

    ffi_lib 'libpcp_mmv.so.1'

    attach_function :mmv_stats_init, [:string, :int, :int, :pointer, :int, :pointer, :int], :pointer
    attach_function :mmv_stats_set, [:pointer, :string, :string, :double], :void

    def initialize(name, cluster, metrics, no_metrics, instances, no_instances)
      @mmv_pointer = mmv_stats_init name, cluster, 0, metrics, no_metrics, instances, no_instances
      error = FFI.errno
      raise RuntimeError, ParfaitRb::MMV::ErrNo.errno(error) if error > 0
    end

    def set_metric(name, cluster, value)
      mmv_stats_set @mmv_pointer, name, cluster, value
    end

  end
end
