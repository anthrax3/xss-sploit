#
# Config class a central placeholder for general console configurations
#
require 'xss/ui/console/shell/commands'
require 'xss/ui/console/prints/print_decoration'

module Xss
module Ui
module Console
module Shell

  class Config
    include Xss::Ui::Console::Prints::Decoration

    attr_accessor :input, :prm

    def initialize
      @_history = Xss::Ui::Console::Shell::History.new
      @file     = File.open(@_history.history_file, 'a')
      @commands = CommandsCore
      @operator = Operator.new
      @operator.add_activity_stack_item(CommandsCore)   # load all commands exist in CommandsCore class to activity_stack (we'll need it in respond_to later)
    end

    def history(line)

      @file.puts(line) if !@_history.line_repeated?(line)

    end

    #
    # To check if the entered line is command or not from CommandsCore class
    #
    def run_command(cmd)
      command = cmd.split # split the entered line to array
      # Send the whole line if the 1st (cmd_ + command -> to be cmd_method) exists in CommandsCore class which is cmd_commandName
      #current_activity.send("cmd_#{command.first}", *command) if current_activity.respond_to?("cmd_#{command.first}")
      if current_activity.respond_to?("cmd_#{command.first}")
        current_activity.send("cmd_#{command.first}", *command)
      else
        puts_err "#{cmd}: Command not found!"
      end
    end

    #
    # current_activity is the current command in the line to be run
    #
    def current_activity
      @operator.activity_stack.last   # Call the command
    end

    #
    # Controls/Prevent using Ctrl+^C interruption
    #
    def interrupt_control
      stty_save = `stty -g`.chomp!
      trap('INT', 'SIG_IGN')
      system('stty', stty_save)
    end

    #
    # Tab completion settings
    #
    def tab_completion(line)
      #if (!tab_completion.nil?)
          ::Readline.completion_append_character = ' '
          ::Readline.basic_word_break_characters = "\x00"
          comp = proc { |s| @commands.sub_commands(line).grep(/^#{Regexp.escape(s)}/) }
          ::Readline.completion_proc = comp
      #end
    end

    #def tab_comp(line)
    #    line = current_activity.cmd_ary
    #    if (!tab_completion.nil?)
    #        ::Readline.completion_append_character = " "
    #        ::Readline.basic_word_break_characters = "\x00"
    #        comp = proc { |s| line.cmd_arry.grep(/^#{Regexp.escape(s)}/) }
    #        ::Readline.completion_proc = comp
    #    end
    #end


  end # Prompt

end # Shell
end # Console
end # Ui
end # Xss
