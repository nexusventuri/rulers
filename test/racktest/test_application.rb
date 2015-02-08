require_relative "../test_helper"

class RulersAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		TestApp.new
	end

	def test_request
		get "/"

		assert last_response.not_found?
	end

	def test_content_type
		get "/"

		assert last_response.not_found?
		header = last_response.header

		assert header["Content-Type"] == 'text/html'
	end
end
