require "rulers/version"

module Rulers
  # Your code goes here...
 class Application
   def call(env)
     [200, {'Content-Type' => 'text/html'},
      ['Hello form Ruby on Rulers!']
     ]
   end
 end 
end