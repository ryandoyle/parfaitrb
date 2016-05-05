require 'spec_helper'

describe ParfaitRb::MMV::MMVIndom do

  let(:mmv_instances) { described_class.new }


  describe '[:serial]=' do
    it 'should set correctly' do
      expect{mmv_instances[:serial] = 1}.to_not raise_error
    end
  end

  describe '[:count]=' do
    it 'should set correctly' do
      expect{mmv_instances[:count] = 2}.to_not raise_error
    end
  end

  describe '[:instances]=' do
    it 'should set the instances' do
      number_of_instances = 2

      instances = FFI::MemoryPointer.new(ParfaitRb::MMV::MMVInstances, number_of_instances)
      instances_ref = number_of_instances.times.collect do |i|
        ParfaitRb::MMV::MMVInstances.new(instances + i * ParfaitRb::MMV::MMVInstances.size)
      end
      instances_ref[0][:internal] = 1
      instances_ref[0][:external] = 'inst1'
      instances_ref[1][:internal] = 2
      instances_ref[1][:external] = 'inst2'


      expect{mmv_instances[:instances] = instances}.to_not raise_error
    end
  end

  describe '[:shorttext]=' do
    it 'should set correctly' do
      expect{mmv_instances[:shorttext] = FFI::MemoryPointer.from_string('my short text')}.to_not raise_error
    end
  end

  describe '[:helptext]=' do
    it 'should set correctly' do
      expect{mmv_instances[:helptext] = FFI::MemoryPointer.from_string('my help text')}.to_not raise_error
    end

  end

end