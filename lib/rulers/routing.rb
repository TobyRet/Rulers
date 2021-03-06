module Rulers
  class Application
    def get_controller_and_action(env)
      _, controller_name, action, after = env['PATH_INFO'].split('/', 4)

      controller = controller_name.capitalize
      controller += "Controller"

      [Object.const_get(controller), action]
    end

    def get_home_controller_and_action
      [Object.const_get('HomeController'), 'show']
    end
  end
end
