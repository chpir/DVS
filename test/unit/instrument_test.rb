require 'test_helper'

class InstrumentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Instrument.new.valid?
  end
end
