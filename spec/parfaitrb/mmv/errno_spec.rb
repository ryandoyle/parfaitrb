require 'spec_helper'

describe ParfaitRb::MMV::ErrNo do
  before(:each) do

  end

  it 'returns the error string if it is a known error number' do
    expect(described_class.errno(5)).to eq 'EIO: I/O error'
  end

  it 'returns the error number as a string if it is unknown' do
    expect(described_class.errno(255)).to eq '255'
  end

end