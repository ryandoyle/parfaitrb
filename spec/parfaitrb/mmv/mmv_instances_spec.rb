require 'spec_helper'

describe ParfaitRb::MMV::MMVInstances do

  let(:mmv_instances) { described_class.new }


  describe '[:external]=' do
    it 'should set correctly' do
      expect{mmv_instances[:external] = 'within.64.bits'}.to_not raise_error
    end
    it 'should raise an error if the instance name is longer than 63 characters' do
      expect{mmv_instances[:external] = 'instance.name.that.is.over.64.characters.long.abc123abc123abc123'}.to raise_error ArgumentError
    end
  end

  describe '[:internal]=' do
    it 'should set correctly' do
      expect{mmv_instances[:internal] = 123}.to_not raise_error
    end
    it 'should raise an error if greater than 32 bits' do
      expect{mmv_instances[:internal] = 5_000_000_000}.to raise_error RangeError
    end
  end

end