require 'spec_helper'

describe ParfaitRb::MMV::MMVMetric do

  let(:mmv_metric) { described_class.new }

  # typedef struct mmv_metric {
  # char		          name[MMV_NAMEMAX];  /* 64 */
  # __uint32_t		    item;		            /* Unique identifier */
  # mmv_metric_type_t	type;               /* Enum */
  # mmv_metric_sem_t	semantics;          /* Enum */
  # pmUnits		        dimension;          /* 32 bits of data */
  # __uint32_t		    indom;		          /* Indom serial */
  # char *		        shorttext;	        /* Short help text string */
  # char *		        helptext;	          /* Long help text string */
  # } mmv_metric_t;

  describe '[:name]=' do
    it 'should be able to set the name correctly' do
      expect{mmv_metric[:name] = 'within.64.bits'}.to_not raise_error
    end
    it 'should raise an error if the metric name is longer than 63 characters' do
      # We know the length because its in the struct, but in the internals of the
      # mmv initialisation end up putting a \0 byte at the end, clearing out the
      # last character if we used the full 64 bits, hence why it can't be longer
      # than 63 characters.
      expect{mmv_metric[:name] = 'metric.name.that.is.exactly.64.characters.long.abc123abc123abc12'}.to raise_error ArgumentError
    end
  end

  describe '[:item]=' do
    it 'should set correctly' do
      expect{mmv_metric[:item] = 123}.to_not raise_error
    end
    it 'should raise an error if greater than 32 bits' do
      expect{mmv_metric[:item] = 5_000_000_000}.to raise_error RangeError
    end
  end

  describe '[:type]=' do
    it 'should set correctly' do
      expect{mmv_metric[:item] = ParfaitRb::MMV::MMV_TYPE_I32}.to_not raise_error
    end
  end

  describe '[:semantics]=' do
    it 'should set correctly' do
      expect{mmv_metric[:semantics] = ParfaitRb::MMV::MMV_SEM_INSTANT}.to_not raise_error
    end
  end

  describe '[:dimension]' do
    it 'should set correctly' do
      # This probably isn't a valid dimension, its up to PmUnits to encode an int correctly
      expect{mmv_metric[:dimension] = 123}.to_not raise_error
    end
  end

  describe '[:indom]' do
    it 'should set correctly' do
      expect{mmv_metric[:indom] = 456}.to_not raise_error
    end
  end

  describe '[:shorttext]' do
    it 'should set correctly' do
      expect{mmv_metric[:shorttext] = FFI::MemoryPointer.from_string('My short text')}.to_not raise_error
    end
  end

  describe '[:helptext]' do
    it 'should set correctly' do
      expect{mmv_metric[:helptext] = FFI::MemoryPointer.from_string('My help text')}.to_not raise_error
    end
  end

end