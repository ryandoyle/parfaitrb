require 'spec_helper'

describe PartfaitRb::Registry do

  let(:metrics_writer) { double('Metrics Writer') }
  let(:registry) { described_class.new('myregistry', metrics_writer) }

  describe '#register' do
    it 'raises an error if the metric is already in the registry' do
      metric1 = double('metric1')
      metric2 = double('metric2', )
      allow(metric1).to receive(:==).with(metric2).and_return true
      allow(metric1).to receive(:metric)
      allow(metric2).to receive(:metric)


      registry.register(metric1)

      expect{registry.register(metric2)}.to raise_error ArgumentError
    end

    it 'raises an error if the metric already has a instance with different semantics' do
      metric1 = double('metric1')
      metric2 = double('metric2')
      allow(metric1).to receive(:==)
      allow(metric1).to receive(:metric).and_return 'my.metric'
      allow(metric2).to receive(:metric).and_return 'my.metric'
      allow(metric1).to receive(:same_semantics?).with(metric2).and_return false

      registry.register(metric1)

      expect{registry.register(metric2)}.to raise_error ArgumentError
    end

  end
end