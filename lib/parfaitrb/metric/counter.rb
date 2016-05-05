require 'parfaitrb/unit'

module ParfaitRb::Metric
  class Counter

    MATCH_METRIC_PART = /(.*)\[/
    MATCH_INSTANCE_PART = /\[(.*)\]/

    attr_reader :name, :unit, :description, :value

    def initialize(name, opts = {})
      @name = name
      @unit = opts[:unit] || ParfaitRb::Unit.count
      @description = opts[:description] || ''
      @value = opts[:initial_value] || 0
      @listeners = []
    end


    def metric
      match = @name.match(MATCH_METRIC_PART)
      match ? match[1] : @name
    end

    def instance
      match = @name.match(MATCH_INSTANCE_PART)
      match ? match[1] : nil
    end

    def add_listener(listener)
      @listeners << listener
    end

    def increment!
      increment_by! 1
    end

    def increment_by!(amount)
      @value += amount
      notify_listeners
    end

    def ==(other)
      name == other.name
    end

    def same_semantics?(other)
      self.class == other.class && \
      metric == other.metric && \
      unit == other.unit && \
      description == other.description
    end

    private

    def notify_listeners
      @listeners.each {|l| l.receive(self) }
    end

  end
end
