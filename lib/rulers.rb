require "rulers/version"
require "rulers/array"

module Rulers
	class Application
		def call(env)
			`echo debug > debug.txt`;
			[200, {'Content-Type' => 'text/html'},["Hello, world from rulers!"]]
		end
	end
end
