module ParfaitRb
  class MMV
    class MetricsWriter

      def initialize(name, metrics, cluster)
        @name = name
        @metrics = metrics
        @cluster = cluster
        @started = false
      end

      def start
        raise ArgumentError, "writer has already started" if started?
        # @mmv = ParfaitRb::MMV.new(@name, @cluster, nil, nil, nil, number_of_indoms)
        @mmv = ParfaitRb::MMV.new(@name, @cluster, mmv_metrics, @metrics.uniq(&:metric).count, nil, 0)
        @started = true
      end

      def started?
        @started
      end

      def notify(metric)
        @mmv.set_metric(metric.metric, nil, metric.value) if @started
      end

      private

      def mmv_metrics
        @mmv_metrics ||= build_mmv_metrics
      end

      def build_mmv_metrics
        mmv_metric_length = @metrics.uniq(&:metric).count

        start_of_metrics_array = FFI::MemoryPointer.new(ParfaitRb::MMV::MMVMetric, mmv_metric_length)
        metrics = mmv_metric_length.times.collect do |i|
          ParfaitRb::MMV::MMVMetric.new(start_of_metrics_array + i * ParfaitRb::MMV::MMVMetric.size)
        end

        @metrics.uniq(&:metric).each_with_index do |m, i|
          metrics[i][:name] = m.metric
          metrics[i][:item] = i + 1 # "Unique identifier"
          metrics[i][:type] = ParfaitRb::MMV::MMV_TYPE_U64 # TODO: determine what this actually is
          metrics[i][:semantics] = ParfaitRb::MMV::MMV_SEM_COUNTER # TODO: determine what this actually is
          metrics[i][:dimension] = ParfaitRb::MMV::PmUnits.new(:dim_space => 1, :dim_time => -1, :scale_space => 1, :scale_time => 3).to_int32
          metrics[i][:shorttext] = FFI::MemoryPointer.from_string(m.description) # TODO: Make sure this is free-ed
          metrics[i][:helptext] = FFI::MemoryPointer.from_string(m.description)  # TODO: Make sure this is free-ed
          # TODO: no instance support!
        end

        start_of_metrics_array
      end

      def mmv_indoms
        @mmv_indoms ||= build_mmv_indoms
      end

      def build_mmv_indoms
        # number_of_indoms = 2
        # indoms = FFI::MemoryPointer.new(ParfaitRb::MMV::MMVIndom, number_of_indoms)
        # indoms_ref = number_of_indoms.times.collect do |i|
        #   ParfaitRb::MMV::MMVIndom.new(indoms + i * ParfaitRb::MMV::MMVIndom.size)
        # end

        # Create the outer MMVIndom list
        indoms = FFI::MemoryPointer.new(ParfaitRb::MMV::MMVIndom, number_of_indoms)

        indoms_ref = number_of_indoms.times.collect do |i|
          ParfaitRb::MMV::MMVIndom.new(indoms + i * ParfaitRb::MMV::MMVIndom.size)
        end

        metric_names_with_instances = @metrics.select { |m| m.instance != nil }.uniq(&:metric).map(&:metric)

        # Populate the indoms



      end

      def number_of_indoms
        @metrics.select { |m| m.instance != nil }.uniq(&:metric).size
      end





    end
  end
end