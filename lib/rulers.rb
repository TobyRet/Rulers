require 'rulers/version'
require 'rulers/routing'
require 'pry'

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] =='/'
        klass, action = get_home_controller_and_action
        controller = klass.new(env)

        text = controller.send(action) 

        return [200, {'Content-Type' => 'text/html'}, [text]]
      end

      klass, action = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(action)
      rescue Exception => e
        puts "Error: #{e.message}"
        return [500, {'Content-type' => 'text/html'}, ['Something went wrong']]
      end

      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
