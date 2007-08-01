require File.dirname(__FILE__) + '/../test_helper'

class BlockTest < Test::Unit::TestCase
  fixtures :design_blocks, :profiles

  def setup
    @profile = Profile.find(1)
  end

  def test_setup_assumptions
    assert @profile.valid?
  end
#TODO remove it this tests are now on design plugin
#  # Replace this with your real tests.
#  def test_create
#    count = Block.count 
#    b = Block.new
#    assert !b.valid?
#    assert b.errors.invalid?(:box_id)
#    assert b.errors.invalid?(:position)
#    
#    box = Box.new
#    box.owner = @profile
#    box.number = 1000
#    assert box.save
#    b.box = box
#    assert !b.valid?
#    assert b.errors.invalid?(:position)
#
#    b.position=1
#    assert b.save
#
#    assert_equal count + 1, Block.count
#  end
#
#  def test_box_presence
#    b = Block.new
#    b.position = 1000
#    assert !b.valid?
#    assert b.errors.invalid?(:box_id)
#
#    box = Box.new
#    box.owner = @profile
#    box.number = 1000
#    assert box.save
#    b.box = box
#    assert b.valid?
#
#  end
#
#  def test_destroy
#    b = Block.find(1)
#    assert b.destroy 
#  end
#
#  def test_valid_fixtures
#    Block.find(:all).each do |b|
#      assert b.valid?
#    end
#  end

end
