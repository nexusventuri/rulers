require_relative "../test_helper"

class HelloController < Rulers::Controller
  def world
    "Hello world!!"
  end
end

class HomeControllerTest < Test::Unit::TestCase
	include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_hello_controller
    get "/hello/world"

    assert last_response.ok?
    assert last_response.body["Hello world!!"]
  end

  def test_not_found
    get "/not/found"

    assert last_response.not_found?
  end
end
