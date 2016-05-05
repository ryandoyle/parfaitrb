require 'ffi'

module ParfaitRb; class MMV

  # typedef struct mmv_metric {
  # char		          name[MMV_NAMEMAX];  /* 64 */
  # __uint32_t		    item;		            /* Unique identifier */
  # mmv_metric_type_t	type;               /* Enum */
  # mmv_metric_sem_t	semantics;          /* Enum */
  # pmUnits		        dimension;          /* 32 bits of data */
  # __uint32_t		    indom;		          /* Indom serial */
  # char *		        shorttext;	        /* Short help text string */
  # char *		        helptext;	          /* Long help text string */
  # } mmv_metric_t;

  class MMVMetric < FFI::Struct
    MMV_NAMEMAX = 64
    layout :name, [:char, MMV_NAMEMAX],
           :item, :uint32,
           :type, :int,
           :semantics, :int,
           :dimension, :int32,
           :indom, :uint32,
           :shorttext, :pointer,
           :helptext, :pointer

    def []=(key,value)
      raise ArgumentError, 'Metric name must be equal or less than 64 characters' if key.eql?(:name) && value.length >= MMV_NAMEMAX
      super(key,value)
    end
  end

end
end
