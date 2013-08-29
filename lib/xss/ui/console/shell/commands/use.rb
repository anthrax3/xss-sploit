module Xss
module Ui
module Console
module Shell
module Commands

  class Use

    attr_accessor :cmd_ary

    def initialize
        self.cmd_ary = commands.keys.sort
    end

    def name
        'Use'
    end

    #
    # A hash of inner commands in show
    # The hash keys: all, exploits, @param[payloads], encoders, wiki
    #
    def commands

      {
          'exploit'  => 'Show all available exploits.',
          'encoders' => 'Show all available encoders.',
          'wiki'     => 'Show the wiki.'
      }

    end

    #
    # Just what the command use to do
    #
    def action
        puts "use command!\n\n"
        puts "\n\n"
    end

  end # Use

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
