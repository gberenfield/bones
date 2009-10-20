require 'test_helper'

class SkeletalsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Skeletals.new.valid?
  end
end
