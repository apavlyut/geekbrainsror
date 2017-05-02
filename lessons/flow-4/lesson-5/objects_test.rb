require 'test/unit'
require './objects'

class ObjectsTest < Test::Unit::TestCase
  def test_say_hello_name_correct
    obj = Objects.new 'alex'
    assert_equal obj.say_hello_name, 'alex'
  end

  def test_say_hello_name_incorrect
    obj = Objects.new 'alex'
    assert_not_equal obj.say_hello_name, 'alex2'
  end

  def test_say_hello_name_default
    obj = Objects.new
    assert_equal obj.say_hello_name, 'default'
  end
end
