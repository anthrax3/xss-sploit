module Xss
module Ui
module Console
module Shell
module Commands

  class Use

    attr_accessor :sub_cmd_ary

    def initialize
        self.sub_cmd_ary = commands.keys.sort
    end

    #
    # Contains command information
    # @return [Hash] {command => Description}
    #
    def self.info
      {'use' => 'Selects a module by name'}
    end

    def self.usage
      puts "Usage: use module_name\n\n"
      puts "The use command is used to interact with a module of a given name.\n\n"
    end

    #
    # A hash of inner commands in show
    # The hash keys: all, exploits, @param[payloads], encoders, wiki
    #
    def commands

      {
          'exploit' => 'Show all available exploits.',
          'encoder' => 'Show all available encoders.',
          'wiki'    => 'Show the wiki.'
      }

    end

    #
    # Just what the command use to do
    #
    def action
      puts "use command!\n\n"
      puts "\n"
    end

  end # Use

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
