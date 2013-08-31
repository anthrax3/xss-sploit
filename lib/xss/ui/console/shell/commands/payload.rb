module Xss
module Ui
module Console
module Shell
module Commands

  class Payload

    attr_accessor :sub_cmd_ary

    def initialize
        self.sub_cmd_ary = commands.keys.sort
    end

    def name
        'Payload'
    end
    # {command => Description}
    def self.info
      {'payload' => 'Help menu - Show This screen'}
    end

    # Command usage
    def self.usage
      puts %q{Usage: payload}
    end


    #
    # A hash of inner commands in payload
    #
    def commands
      {
        'all' => 'Show all available exploits, payloads and encoders.',
        'exploits' => 'Show all available exploits.',
        'payloads' => 'Show all available payloads.',
        'encoders' => 'Show all available encoders.',
        'wiki' => 'Show the wiki.'
      }
    end

    #
    # Just what the command use to do
    #
    def action
      puts "payload command!"
    end

  end # Payload

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
