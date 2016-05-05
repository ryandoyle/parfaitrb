require 'ffi'

module ParfaitRb; class MMV

  # typedef struct mmv_instances {
  # __int32_t   internal;	              /* Internal instance ID */
  # char        external[MMV_NAMEMAX];  /* External instance ID */
  # } mmv_instances_t;


  # Somewhat poorly named, this corresponds to a single instance,
  # not multiple instances.
  class MMVInstances < FFI::Struct
    MMV_NAMEMAX = 64
    layout :internal, :int32,
           :external, [:char, MMV_NAMEMAX]

    def []=(key,value)
      raise ArgumentError, 'Instance name must be equal or less than 64 characters' if key.eql?(:external) && value.length >= MMV_NAMEMAX
      super(key,value)
    end
  end

end
end
