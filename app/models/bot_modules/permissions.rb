module BotModules
  # Permissions of BotModule.
  class Permissions < Inum::Base
    define :PRIVATE_MODULE, 0
    define :PUBLIC_MODULE,  1
    define :FREEDOM_MODULE, 2
  end
end
