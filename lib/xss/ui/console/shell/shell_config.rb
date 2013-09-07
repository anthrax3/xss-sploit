#
# Config class a central placeholder for general console configurations
#
require 'xss/ui/console/shell/commands'
require 'xss/ui/console/prints/print_decoration'
require 'pry'

module Xss
module Ui
module Console
module Shell

  class Config
    include Xss::Ui::Console::Prints::Decoration
    include Xss::Ui::Console::Shell::Commands

    attr_accessor :input, :prm

    def initialize
      @_history = Xss::Ui::Console::Shell::History.new
      @file     = File.open(@_history.history_file, 'a')
      @commands = CommandsCore
    end

    #
    # Appends the entered line to history file if not repeated
    #
    def history(line)

      @file.puts(line) if !@_history.line_repeated?(line)

    end

    #
    # To check if the entered line is command or not from CommandsCore class
    #
    def run_command(cmd)

    end

    #
    # current_activity is the current command in the line to be run
    #
    def current_activity

    end

    #
    # Controls/Prevent using *Ctrl+^C* interruption
    #
    def interrupt_control(line)
      stty_save = `stty -g`.chomp!
      trap('INT', 'SIG_IGN')
      system('stty', stty_save)
    end

    #
    # Tab completion settings
    #
    def tab_complete#(line)

    end

  end # Prompt

end # Shell
end # Console
end # Ui
end # Xss
