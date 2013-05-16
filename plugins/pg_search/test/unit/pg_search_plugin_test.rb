require 'test_helper'

class PgSearchPluginTest < ActiveSupport::TestCase
  def setup
    @environment = Environment.default
    @environment.enable_plugin(PgSearchPlugin)
  end

  should 'locate profile' do
    profile = fast_create(Profile, :name => 'John', :identifier => 'waterfall')
    assert_includes search(Profile, 'John'), profile
    assert_includes search(Profile, 'john'), profile
    assert_includes search(Profile, 'waterfall'), profile
    assert_includes search(Profile, 'water'), profile
  end

  private

  def search(scope, query)
    scope.pg_search_plugin_search(query)
  end
end
