module ParfaitRb
  class Unit

    COUNT = :count

    BYTE = :byte
    KILOBYTE = :kilobyte
    MEGABYTE = :megabyte
    GIGABYTE = :gigabyte
    TERABYTE = :terabyte
    PETABYTE = :petabyte
    EXABYTE = :exabyte

    NANOSECOND = :nanosecond
    MICROSECOND = :microsecond
    MILLISECOND = :millisecond
    SECOND = :second
    MINUTE = :minute
    HOUR = :hour

    attr_reader :domain, :range

    def self.count
      Unit.new(COUNT, nil)
    end

    def self.count_per(unit)
      Unit.new(COUNT, unit.domain)
    end

    def self.byte
      Unit.new(BYTE, nil)
    end
    def self.bytes_per(unit)
      Unit.new(BYTE, unit.domain)
    end

    def self.kilobyte
      Unit.new(KILOBYTE, nil)
    end

    def self.kilobytes_per(unit)
      Unit.new(KILOBYTE, unit.domain)
    end

    def self.megabyte
      Unit.new(MEGABYTE, nil)
    end

    def self.megabytes_per(unit)
      Unit.new(MEGABYTE, unit.domain)
    end

    def self.gigabyte
      Unit.new(GIGABYTE, nil)
    end

    def self.gigabytes_per(unit)
      Unit.new(GIGABYTE, unit.domain)
    end

    def self.terabyte
      Unit.new(TERABYTE, nil)
    end

    def self.terabytes_per(unit)
      Unit.new(TERABYTE, unit.domain)
    end

    def self.petabyte
      Unit.new(PETABYTE, nil)
    end

    def self.petabytes_per(unit)
      Unit.new(PETABYTE, unit.domain)
    end

    def self.exabyte
      Unit.new(EXABYTE, nil)
    end

    def self.exabytes_per(unit)
      Unit.new(EXABYTE, unit.domain)
    end

    def self.nanosecond
      Unit.new(NANOSECOND, nil)
    end

    def self.nanoseconds_per(unit)
      Unit.new(NANOSECOND, unit.domain)
    end

    def self.microsecond
      Unit.new(MICROSECOND, nil)
    end

    def self.microseconds_per(unit)
      Unit.new(MICROSECOND, unit.domain)
    end

    def self.millisecond
      Unit.new(MILLISECOND, nil)
    end

    def self.milliseconds_per(unit)
      Unit.new(MILLISECOND, unit.domain)
    end

    def self.second
      Unit.new(SECOND, nil)
    end

    def self.seconds_per(unit)
      Unit.new(SECOND, unit.domain)
    end

    def self.minute
      Unit.new(MINUTE, nil)
    end

    def self.minutes_per(unit)
      Unit.new(MINUTE, unit.domain)
    end

    def self.hour
      Unit.new(HOUR, nil)
    end

    def self.hours_per(unit)
      Unit.new(HOUR, unit.domain)
    end

    def ==(other)
      self.class == other.class && \
      domain == other.domain && \
      range == other.range
    end

    private

    def initialize(domain, range)
      @domain = domain
      @range = range
    end

  end
end