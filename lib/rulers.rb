require "rulers/version"
require "rulers/array"
require "rulers/util"
require "rulers/dependencies"

module Rulers
	class Application
		def call(env)
			`echo debug > debug.txt`;
			if env["PATH_INFO"] == "/"
			  return homepage(env)
			end

		  controller_name, action = get_controller_and_action(env)
		  return dispatch(env, Object.const_get(controller_name), action)

		  return not_found
		end

		def homepage(env)
		  if File.exists?("public/index.html")
		    return [200, {'Content-Type' => 'text/html'}, [File.read("public/index.html")]]
		  end

		  return dispatch(env, HomeController, :index)

		  return not_found
		end

    def class_with_method_exist?(controller_name, action)
      return false unless Object.const_defined?(controller_name)

      Object.const_get(controller_name).method_defined?(action)
    end

		def dispatch(env, klass, action)
		  controller = klass.new(env)
		  begin
		    text = controller.send(action)
		  rescue => e
		    return handle_exception(env, e)
		  end
			[200, {'Content-Type' => 'text/html'},[text]]
		end

		def not_found
      [404, {'Content-Type' => 'text/html'}, []]
		end

		def get_controller_and_action(env)
		  _, cont, action, after = env["PATH_INFO"].split("/", 4)
		  cont = cont.capitalize + "Controller" # PeopleController

		  [cont, action]
		end

		def handle_exception(env, exception)
		  body = "An exception occurred running your application<br>"
		  body += "#{exception.message}<br><br>"
		  body += exception.backtrace.join("<br/>")

		  [500, {'Content-Type' => 'text/html'}, [body]]
		end
	end

	class Controller
	  def initialize(env)
	    @env = env
	  end

    def post?
      env["REQUEST_METHOD"] == "POST"
    end

	  def env
	    @env
	  end
	end
end
