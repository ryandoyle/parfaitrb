require 'spec_helper'

describe ParfaitRb::Metric::Counter do

  describe '#name' do
    it 'returns the metric name' do
      expect(described_class.new('my.metric').name).to eq 'my.metric'
    end
    it 'returns the metric name with the instance if created with an instance' do
      expect(described_class.new('my.metric[foops]').name).to eq 'my.metric[foops]'
    end
  end

  describe '#metric' do
    it 'returns the metric name when there are no instances' do
      expect(described_class.new('my.metric').metric).to eq 'my.metric'
    end
    it 'returns the metric name if there in an instance' do
      expect(described_class.new('my.metric[foops]').metric).to eq 'my.metric'
    end
  end

  describe '#instance' do
    it 'is null if the metric does not have in instance' do
      expect(described_class.new('my.metric').instance).to eq nil
    end
    it 'returns the instance for a metric with an instance' do
      expect(described_class.new('my.metric[foops]').instance).to eq 'foops'
    end
  end

  describe '#unit' do
    it 'defaults to :count' do
      expect(described_class.new('my.metric').unit).to eq ParfaitRb::Unit.count
    end
    it 'sets the unit if given' do
      unit = double('PartfaitRb::Unit')
      expect(described_class.new('my.metric', :unit => unit).unit).to eq unit
    end
  end

  describe '#description' do
    it 'returns the description' do
      expect(described_class.new('my.metric', :description => 'My description').description).to eq 'My description'
    end
    it 'returns a blank description if not set' do
      expect(described_class.new('my.metric').description).to eq ''
    end
  end

  describe '#value' do
    it 'returns the value of the counter' do
      expect(described_class.new('my.metric').value).to be_a Fixnum
    end
    it 'defaults to 0' do
      expect(described_class.new('my.metric').value).to eq 0
    end
    it 'can have an initial value set through the constructor' do
      expect(described_class.new('my.metric', :initial_value => 123).value).to eq 123
    end
  end

  describe '#increment!' do
    it 'increments the value of the counter when called' do
      counter = described_class.new('my.metric')
      counter.increment!
      expect(counter.value).to eq 1
    end
    it 'increments the value of the counter by how many times it is called' do
      counter = described_class.new('my.metric')
      counter.increment!
      counter.increment!
      expect(counter.value).to eq 2
    end
    it 'notifies any listeners' do
      listener = double('MyMetricListener')
      counter = described_class.new('my.metric')
      counter.add_listener(listener)

      expect(listener).to receive(:receive).with(counter)

      counter.increment!
    end
  end

  describe '#increment_by!' do
    it 'increments the value of the counter by an amount specified' do
      counter = described_class.new('my.metric')
      counter.increment_by! 10
      expect(counter.value).to eq 10
    end
    it 'notifies any listeners' do
      listener = double('MyMetricListener')
      counter = described_class.new('my.metric')
      counter.add_listener(listener)

      expect(listener).to receive(:receive).with(counter)

      counter.increment_by! 123
    end
  end

  describe '#==' do
    it 'is true for metrics with the same name' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1')
      metric2 = described_class.new('my.metric[abc]', :description => 'desc1')

      expect(metric1).to eq metric2
    end
    it 'is false for metrics that have different names' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1')
      metric2 = described_class.new('my.metric[def]', :description => 'desc1')

      expect(metric1).to_not eq metric2
    end
  end

  describe 'same_semantics?' do
    it 'is false if the metrics are a different class' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1', :unit => ParfaitRb::Unit.count)
      metric2 = 'a string'

      expect(metric1.same_semantics?(metric2)).to be false
    end
    it 'is false if the metric is different' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1', :unit => ParfaitRb::Unit.count)
      metric2 = described_class.new('notmy.metric[def]', :description => 'desc1', :unit => ParfaitRb::Unit.count)

      expect(metric1.same_semantics?(metric2)).to be false
    end
    it 'is false if the description is different' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1', :unit => ParfaitRb::Unit.count)
      metric2 = described_class.new('my.metric[def]', :description => 'desc2', :unit => ParfaitRb::Unit.count)

      expect(metric1.same_semantics?(metric2)).to be false
    end
    it 'is false if the unit is different' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1', :unit => ParfaitRb::Unit.count)
      metric2 = described_class.new('my.metric[def]', :description => 'desc1', :unit => ParfaitRb::Unit.second)

      expect(metric1.same_semantics?(metric2)).to be false
    end
    it 'is true if the class, metric, description and unit are the same' do
      metric1 = described_class.new('my.metric[abc]', :description => 'desc1', :unit => ParfaitRb::Unit.count)
      metric2 = described_class.new('my.metric[def]', :description => 'desc1', :unit => ParfaitRb::Unit.count)

      expect(metric1.same_semantics?(metric2)).to be true
    end

  end


end