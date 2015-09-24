require 'minitest/autorun'

# describe "foobar::default" do
#   it "has created foobar.txt" do
#     assert File.exists?("/usr/local/foobar.txt")
#   end
# end

class TestCarton < Minitest::Unit::TestCase
  def setup
  end

  def test_that_something_can_be_whatever
    assert_equal 'blah', 'blah'
  end

  def test_that_something_isnt_something
    refute_match(/^no/i, 'yes')
  end

  def test_that_will_be_skipped
    skip 'test this later'
  end
end
