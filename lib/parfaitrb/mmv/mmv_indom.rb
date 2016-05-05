require 'ffi'

require 'parfaitrb/mmv/mmv_instances'

module ParfaitRb; class MMV

#   typedef struct mmv_indom {
#     __uint32_t        serial;     /* Unique identifier */
#     __uint32_t        count;      /* Number of instances */
#     mmv_instances_t *	instances;  /* Internal/external IDs */
#     char *            shorttext;  /* Short help text string */
#     char *            helptext;   /* Long help text string */
# } mmv_indom_t;


  class MMVIndom < FFI::Struct
    layout :serial, :uint32,
           :count, :uint32,
           :instances, :pointer,
           :shorttext, :pointer,
           :helptext, :pointer
  end

end
end
