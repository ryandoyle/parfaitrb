require 'spec_helper'

describe ParfaitRb::MMV::MetricsWriter do

  before do
    allow(ParfaitRb::MMV).to receive(:new)
  end

  describe '#start' do
    it 'raises an error if already started' do
      writer = described_class.new('mymetrics', [], nil)
      writer.start

      expect{writer.start}.to raise_error ArgumentError
    end

    it 'creates a MMV instance with the correct number of indoms' do
      metrics = [
          double('memory', :metric => 'memory', :instance => nil),
          double('cpu[1]', :metric => 'memory', :instance => '1'),
          double('disk[sda]', :metric => 'disk', :instance => 'sda'),
          double('disk[sdb]', :metric => 'disk', :instance => 'sdb'),
          double('disk[sdc]', :metric => 'disk', :instance => 'sdc'),
          double('network[eth0]', :metric => 'network', :instance => 'eth0'),
          double('network[eth1]', :metric => 'network', :instance => 'eth1'),
      ]

      expect(ParfaitRb::MMV).to receive(:new).with(anything, anything, anything, anything, anything, 3)

      described_class.new('mymetics', metrics, 123).start
    end
  end


end