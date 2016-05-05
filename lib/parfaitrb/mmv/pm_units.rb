require 'ffi'

module ParfaitRb
  class MMV
  # class PmUnits < FFI::Struct
  class PmUnits
    # Not sure if this will work, need to specify the sizes of int
    # layout :dimSpace,   [:int,  4],
    #        :dimTime,    [:int,  4],
    #        :dimCount,   [:int,  4],
    #        :scaleSpace, [:uint, 4],
    #        :scaleTime,  [:uint, 4],
    #        :scaleCount, [:int,  4],
    #        :pad,        [:uint, 8]

    attr_reader :dim_space, :dim_time, :dim_count, :scale_space, :scale_time, :scale_count

    def initialize(opts = {})
      @dim_space = signed_and_4_bit_representable(opts[:dim_space] || 0)
      @dim_time = signed_and_4_bit_representable(opts[:dim_time] || 0)
      @dim_count = signed_and_4_bit_representable(opts[:dim_count] || 0)
      @scale_space = unsigned_and_4_bit_representable(opts[:scale_space] || 0)
      @scale_time = unsigned_and_4_bit_representable(opts[:scale_time] || 0)
      @scale_count = signed_and_4_bit_representable(opts[:scale_count] || 0)
    end

    def to_int32
      # FIXME: not platform independent
      as_an_init_32 = (@dim_space << 28)
      as_an_init_32 |= (@dim_time << 24)
      as_an_init_32 |= (@dim_count << 20)
      as_an_init_32 |= (@scale_space << 16)
      as_an_init_32 |= (@scale_time << 12)
      as_an_init_32 |= (@scale_count << 0)
      as_an_init_32
    end


    private

    # Is the number passed within the bounnds of representing a signed 4 bit number?
    def signed_and_4_bit_representable(number)
      raise ArgumentError, "#{number} is out of bounds. Must be between -7 to 7" if number > 7 || number < -7
      number
    end

    #
    def unsigned_and_4_bit_representable(number)
      raise ArgumentError, "#{number} is out of bounds. Must be between 0 to 15" if number > 15 || number < 0
      number
    end

  end
end
end
