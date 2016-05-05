module PartfaitRb
  class Registry

    def initialize(name, metrics_writer)
      @name = name
      @metrics_writer = metrics_writer
      @metrics = []
    end

    def register(metric)
      raise ArgumentError, "metric #{metric.metric} already registered" if metric_in_registry? metric
      raise ArgumentError, "metric #{metric.metric} has another instance already registered with different semantics" if exists_with_different_semantics? metric
      @metrics << metric
    end

    private

    def metric_in_registry?(metric)
      @metrics.any? {|m| m == metric}
    end

    def exists_with_different_semantics?(metric)
      existing_metric = @metrics.find {|m| m.metric == metric.metric}
      existing_metric ? !existing_metric.same_semantics?(metric) : false
    end

  end
end