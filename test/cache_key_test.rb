require 'test_helper'

class CacheKeyTest < ActiveSupport::TestCase

  class ExampleObject
    def cache_key; 'foo_cache_key' end
    def to_a; [self] end
  end

  test "When object return '[self]' when called `to_a`" do
    obj = ExampleObject.new
    assert_nothing_raised do
      Rails.cache.write(obj, "foo")
    end
    assert_equal Rails.cache.read(obj), 'foo'
  end

  test "mongoid implements 'cache_key'" do
    art = Article.new
    assert art.respond_to?(:cache_key)
  end

end
