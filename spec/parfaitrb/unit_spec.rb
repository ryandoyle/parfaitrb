require 'spec_helper'

describe ParfaitRb::Unit do

  describe '#count' do
    let(:unit) { described_class.count }
    it 'sets the domain to count' do
      expect(unit.domain).to eq described_class::COUNT
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#count_per' do
    let(:unit) { described_class.count_per(described_class.second) }
    it 'sets the domain to count' do
      expect(unit.domain).to eq described_class::COUNT
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end


  describe '#bytes' do
    let(:unit) { described_class.byte }
    it 'sets the domain to bytes' do
      expect(unit.domain).to eq described_class::BYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#bytes_per' do
    let(:unit) { described_class.bytes_per(described_class.second) }
    it 'sets the domain to bytes' do
      expect(unit.domain).to eq described_class::BYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end


  describe '#kilobyte' do
    let(:unit) { described_class.kilobyte }
    it 'sets the domain to kilobyte' do
      expect(unit.domain).to eq described_class::KILOBYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#kilobytes_per' do
    let(:unit) { described_class.kilobytes_per(described_class.second) }
    it 'sets the domain to kilobytes' do
      expect(unit.domain).to eq described_class::KILOBYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end


  describe '#megabyte' do
    let(:unit) { described_class.megabyte }
    it 'sets the domain to megabytes' do
      expect(unit.domain).to eq described_class::MEGABYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#megabytes_per' do
    let(:unit) { described_class.megabytes_per(described_class.second) }
    it 'sets the domain to megabytes' do
      expect(unit.domain).to eq described_class::MEGABYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end


  describe '#gigabyte' do
    let(:unit) { described_class.gigabyte }
    it 'sets the domain to gigabytes' do
      expect(unit.domain).to eq described_class::GIGABYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#gigabytes_per' do
    let(:unit) { described_class.gigabytes_per(described_class.second) }
    it 'sets the domain to gigabytes' do
      expect(unit.domain).to eq described_class::GIGABYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end


  describe '#terabyte' do
    let(:unit) { described_class.terabyte }
    it 'sets the domain to terabytes' do
      expect(unit.domain).to eq described_class::TERABYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#terabytes_per' do
    let(:unit) { described_class.terabytes_per(described_class.second) }
    it 'sets the domain to terabytes' do
      expect(unit.domain).to eq described_class::TERABYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end

  describe '#petabyte' do
    let(:unit) { described_class.petabyte }
    it 'sets the domain to petabytes' do
      expect(unit.domain).to eq described_class::PETABYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#petabytes_per' do
    let(:unit) { described_class.petabytes_per(described_class.second) }
    it 'sets the domain to petabytes' do
      expect(unit.domain).to eq described_class::PETABYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end

  describe '#exabyte' do
    let(:unit) { described_class.exabyte }
    it 'sets the domain to exabytes' do
      expect(unit.domain).to eq described_class::EXABYTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#exabytes_per' do
    let(:unit) { described_class.exabytes_per(described_class.second) }
    it 'sets the domain to exabytes' do
      expect(unit.domain).to eq described_class::EXABYTE
    end
    it 'sets the range to seconds' do
      expect(unit.range).to eq described_class::SECOND
    end
  end


  describe '#nanosecond' do
    let(:unit) { described_class.nanosecond }
    it 'sets the domain to nanoseconds' do
      expect(unit.domain).to eq described_class::NANOSECOND
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#nanoseconds_per' do
    let(:unit) { described_class.nanoseconds_per(described_class.count) }
    it 'sets the domain to nanoseconds' do
      expect(unit.domain).to eq described_class::NANOSECOND
    end
    it 'sets the range to count' do
      expect(unit.range).to eq described_class::COUNT
    end
  end


  describe '#microsecond' do
    let(:unit) { described_class.microsecond }
    it 'sets the domain to microseconds' do
      expect(unit.domain).to eq described_class::MICROSECOND
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#microseconds_per' do
    let(:unit) { described_class.microseconds_per(described_class.count) }
    it 'sets the domain to microseconds' do
      expect(unit.domain).to eq described_class::MICROSECOND
    end
    it 'sets the range to count' do
      expect(unit.range).to eq described_class::COUNT
    end
  end


  describe '#millisecond' do
    let(:unit) { described_class.millisecond }
    it 'sets the domain to milliseconds' do
      expect(unit.domain).to eq described_class::MILLISECOND
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#milliseconds_per' do
    let(:unit) { described_class.milliseconds_per(described_class.count) }
    it 'sets the domain to milliseconds' do
      expect(unit.domain).to eq described_class::MILLISECOND
    end
    it 'sets the range to count' do
      expect(unit.range).to eq described_class::COUNT
    end
  end


  describe '#second' do
    let(:unit) { described_class.second }
    it 'sets the domain to seconds' do
      expect(unit.domain).to eq described_class::SECOND
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#seconds_per' do
    let(:unit) { described_class.seconds_per(described_class.count) }
    it 'sets the domain to seconds' do
      expect(unit.domain).to eq described_class::SECOND
    end
    it 'sets the range to count' do
      expect(unit.range).to eq described_class::COUNT
    end
  end


  describe '#minute' do
    let(:unit) { described_class.minute }
    it 'sets the domain to minute' do
      expect(unit.domain).to eq described_class::MINUTE
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#minutes_per' do
    let(:unit) { described_class.minutes_per(described_class.count) }
    it 'sets the domain to minutes' do
      expect(unit.domain).to eq described_class::MINUTE
    end
    it 'sets the range to count' do
      expect(unit.range).to eq described_class::COUNT
    end
  end


  describe '#hour' do
    let(:unit) { described_class.hour }
    it 'sets the domain to hours' do
      expect(unit.domain).to eq described_class::HOUR
    end
    it 'has a nil range' do
      expect(unit.range).to eq nil
    end
  end
  describe '#hours_per' do
    let(:unit) { described_class.hours_per(described_class.count) }
    it 'sets the domain to hourss' do
      expect(unit.domain).to eq described_class::HOUR
    end
    it 'sets the range to count' do
      expect(unit.range).to eq described_class::COUNT
    end
  end


end