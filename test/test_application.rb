require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
	include Rack::Test::Methods
	
	def app
		TestApp.new
	end

	def test_request
		get "/"

		assert last_response.ok?
		body = last_response.body

		assert body["Hello"]
	end

	def test_content_type
		get "/"
		
		assert last_response.ok?
		header = last_response.header

		assert header["Content-Type"] == 'text/html'
	end
end
