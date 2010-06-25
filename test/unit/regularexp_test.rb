require 'test_helper'

class RegularexpTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Regularexp.new.valid?
  end
end
