module Xss
module Ui
module Console
module Shell
module Commands

  class Exit
    #include Xss::Ui::Console::Shell::Commands

    attr_accessor :cmd_ary

    def initialize
      self.cmd_ary = commands.keys.sort
    end

    def name
      'Exit'
    end
    # {command => Description}
    def self.info
      {'Exit' => 'Exit the console'}
    end


    #
    # A hash of inner commands in update
    #
    def commands
      {}
    end

    #
    # Just what the command use to do
    #
    def action
      puts "See you soon ;)\n\n"
      exit
    end

  end # Exit

end # Commands
end # Shell
end # Console
end # Ui
end # Xss