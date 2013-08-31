module Xss
module Ui
module Console
module Shell
module Commands

  class Set

    attr_accessor :sub_cmd_ary

    def initialize
      self.sub_cmd_ary = commands.keys.sort
    end

    def name
      'Set'
    end

    # {command => Description}
    def self.info
      {'set' => 'Sets a variable to a value'}
    end

    # Command usage
    def self.usage
      puts %q{Usage: set option_name}
    end

    #
    # A hash of inner commands in show
    # The hash keys: all, exploits, @param[payloads], encoders, wiki
    #
    def commands

      {
          'payload'  => 'Show all available exploits.',
          'encoders' => 'Show all available encoders.',
          'wiki'     => 'Show the wiki.'
      }

    end

    #
    # Just what the command use to do
    #
    def action
      puts "use command!\n\n"
    end

  end # Set

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
