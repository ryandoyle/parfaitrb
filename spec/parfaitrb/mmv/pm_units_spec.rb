require 'spec_helper'

describe ParfaitRb::MMV::PmUnits do

  describe 'setting dim_space' do
    it 'raises an error if less than -7' do
      expect{described_class.new(:dim_space => -8)}.to raise_error ArgumentError
    end
    it 'raises an error if more than 7' do
      expect{described_class.new(:dim_space => 8)}.to raise_error ArgumentError
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:dim_space => 7)}.to_not raise_error
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:dim_space => -7)}.to_not raise_error
    end
    it 'defaults to 0 if not set' do
      expect(described_class.new({}).dim_space).to eq 0
    end
  end

  describe 'setting dim_time' do
    it 'raises an error if less than -7' do
      expect{described_class.new(:dim_time => -8)}.to raise_error ArgumentError
    end
    it 'raises an error if more than 7' do
      expect{described_class.new(:dim_time => 8)}.to raise_error ArgumentError
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:dim_time => 7)}.to_not raise_error
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:dim_time => -7)}.to_not raise_error
    end
    it 'defaults to 0 if not set' do
      expect(described_class.new({}).dim_time).to eq 0
    end
  end

  describe 'setting dim_count' do
    it 'raises an error if less than -7' do
      expect{described_class.new(:dim_count => -8)}.to raise_error ArgumentError
    end
    it 'raises an error if more than 7' do
      expect{described_class.new(:dim_count => 8)}.to raise_error ArgumentError
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:dim_count => 7)}.to_not raise_error
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:dim_count => -7)}.to_not raise_error
    end
    it 'defaults to 0 if not set' do
      expect(described_class.new({}).dim_count).to eq 0
    end
  end

  describe 'setting scale_space' do
    it 'raises an error if less than 0' do
      expect{described_class.new(:scale_space => -1)}.to raise_error ArgumentError
    end
    it 'raises an error if more than 15' do
      expect{described_class.new(:scale_space => 16)}.to raise_error ArgumentError
    end
    it 'does not raise an error if constructed within bounds' do
      expect{described_class.new(:scale_space => 7)}.to_not raise_error
    end
    it 'defaults to 0 if not set' do
      expect(described_class.new({}).scale_space).to eq 0
    end
  end

  describe 'setting scale_time' do
    it 'raises an error if less than 0' do
      expect{described_class.new(:scale_time => -1)}.to raise_error ArgumentError
    end
    it 'raises an error if more than 15' do
      expect{described_class.new(:scale_time => 16)}.to raise_error ArgumentError
    end
    it 'does not raise an error if constructed within bounds' do
      expect{described_class.new(:scale_time => 7)}.to_not raise_error
    end
    it 'defaults to 0 if not set' do
      expect(described_class.new({}).scale_time).to eq 0
    end
  end

  describe 'setting scale_count' do
    it 'raises an error if less than -7' do
      expect{described_class.new(:scale_count => -8)}.to raise_error ArgumentError
    end
    it 'raises an error if more than 7' do
      expect{described_class.new(:scale_count => 8)}.to raise_error ArgumentError
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:scale_count => 7)}.to_not raise_error
    end
    it 'does not raise an error if constructed within bounds for positive numbers' do
      expect{described_class.new(:scale_count => -7)}.to_not raise_error
    end
    it 'defaults to 0 if not set' do
      expect(described_class.new({}).scale_count).to eq 0
    end
  end

  describe 'as a 32bit integer' do
    it 'should be valid' do
      expect(described_class.new(:dim_space => 1, :dim_time => -1, :scale_space => 1, :scale_time => 3).to_int32).to eq -16699392
    end
  end

end