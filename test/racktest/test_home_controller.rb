require_relative "../test_helper"

class HomeController < Rulers::Controller
  def index
    "Homepage"
  end
end

class HomeControllerTest < Test::Unit::TestCase
	include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_homepage
    get "/"

    assert last_response.ok?
    assert last_response.body["Homepage"]
  end
end
