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
      @operator = Operator.new
      @operator.add_activity_stack_item(CommandsCore)   # load all commands exist in CommandsCore class to activity_stack (we'll need it in respond_to later)
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
      command = cmd.split # split the entered line to array
      # Send the whole line if the 1st (cmd_ + command -> to be cmd_method) exists in CommandsCore class which is cmd_commandName
      #current_activity.send("cmd_#{command.first}", *command) if current_activity.respond_to?("cmd_#{command.first}")
      if current_activity.respond_to?("cmd_#{command.first}")
        current_activity.send("cmd_#{command.first}", *command)
      elsif cmd.strip.empty?
        # Do nothing!
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
    #def tab_complete#(line)
    #  ::Readline.completion_append_character = ' '
    #  ::Readline.basic_word_break_characters = "\x00"
    #  ary = CommandsCore.instance_methods(false).map do |c|
    #          next unless c.to_s.include? "cmd_"  # Take cmd_methods only!
    #          c.to_s.split("_").last
    #        end
    #  comp = proc { |s| ary.grep(/^#{Regexp.escape(s)}/) }
    #  ::Readline.completion_proc = comp
    #end

    def tab_comp_control(s)

      if ::Readline.line_buffer =~ /help.* /
        Help.new.sub_cmd_ary.grep( /^#{Regexp.escape(s)}/ )
      else
        COMMANDSLIST.grep( /^#{Regexp.escape(s)}/ )
      end

    end

    # Just for testing
    #SET = Set.new.sub_cmd_ary.sort #['payload', 'RHOST'].sort
    #MAIN = ['help', 'show', 'set' , 'use' , 'exit'].sort
    #USE  = Use.new.sub_cmd_ary
    ##p HELP  = Help.new.sub_cmd_ary
    #HELP = ["encode", "exit", "exploit", "help", "payload", "set", "show", "update", "use", "wiki"]

    #
    # Readline.line_buffer, line_buffer is the contents of line during pressing tab @return [String]
    # http://pastie.org/pastes/154219
    # http://pastie.org/pastes/27343
    # http://pastie.org/pastes/2160244
    # http://pastie.org/pastes/668841
    # http://pastie.org/pastes/634220
    # http://pastie.org/pastes/258626 <<
    # http://pastie.org/pastes/8797
    # http://pastie.org/pastes/3883013
    # http://pastie.org/pastes/68665
    #http://pastie.org/161606
    #http://pastie.org/pastes/9261
    #http://pastie.org/pastes/33168
    #http://pastie.org/pastes/35481
    #http://pastie.org/pastes/2826190
    #http://pastie.org/pastes/8810
    #http://pastie.org/pastes/9171
    #http://pastie.org/pastes/68665
    #http://pastie.org/pastes/3883013
    #http://pastie.org/pastes/8797

    def tab_complete#(line)
      ::Readline.completion_append_character = ' '
      ::Readline.basic_word_break_characters = "\x00"

      #completion =
      #proc do |str|
      #  if Readline.line_buffer =~ /"cmd_#{str}".*\s/i
      #    ::Commands.const_get("#{cmd}".capitalize!).new.sub_cmd_ary.grep(/^#{Regexp.escape(str.sub(%r{^show\s+}i, ''))}/i) { |subs| "#{str} #{subs}" }
      #  else
      #    Help.new.sub_cmd_ary.grep(/^#{Regexp.escape(str.sub(%r{^help\s+}i, ''))}/i) { |subs| "help #{subs}" }
      #  end
      #end

      comp = proc do |s|
        Readline.line_buffer.split # line_buffer is the contents of line during pressing tab @return [String]
        if Readline.line_buffer =~ /help.*\s+/i
          Help.new.sub_cmd_ary.grep(/^#{Regexp.escape(s.sub(%r{^help\s+}i, ''))}/i) { |subs| "help #{subs}" }
        elsif Readline.line_buffer =~ /show.*\s+/i
          Show.new.sub_cmd_ary.grep(/^#{Regexp.escape(s.sub(%r{^show\s+}i, ''))}/i) { |subs| "show #{subs}" }
        elsif Readline.line_buffer =~ /use.*\s+/i
          Use.new.sub_cmd_ary.grep(/^#{Regexp.escape(s.sub(%r{^use\s+}i, ''))}/i) { |subs| "use #{subs}" }
        elsif Readline.line_buffer =~ /set.*\s+/i
          Use.new.sub_cmd_ary.grep(/^#{Regexp.escape(s.sub(%r{^set\s+}i, ''))}/i) { |subs| "set #{subs}" }
        else  #if Readline.line_buffer.clear.empty?
          Help.new.sub_cmd_ary.grep(/^#{Regexp.escape(s.sub(%r{^\s+}i, ''))}/i) { |subs| "#{subs}" }
        end
      end

      ::Readline.completion_proc = comp #completion
    end


    #def tab_complete#(line)
    #  ::Readline.completion_append_character = ' '
    #  ::Readline.basic_word_break_characters = "\x00"
    #  ary = CommandsCore.instance_methods(false).map do |c|
    #    next unless c.to_s.include? "cmd_"  # Take cmd_methods only!
    #    c.to_s.split("_").last
    #  end
    #  comp = proc do |s|
    #    if Readline.line_buffer =~ /^.* /
    #      ary.grep( /^#{Regexp.escape(s)}/ )
    #    else
    #      Commands.const_get("#{Readline.line_buffer =~ /^.* /}".capitalize!).new.sub_cmd_ary.grep( /^#{Regexp.escape(s)}/ )
    #    end
    #  end
    #  ::Readline.completion_proc = comp
    #end




    # http://stackoverflow.com/questions/10791060/how-can-i-do-readline-arguments-completion
    def tab_post_comp(line = nil)
      ary = Commands.const_get("#{line}".capitalize!).new.sub_cmd_ary
      ::Readline.completion_proc = proc { |s| ary.grep(/^#{Regexp.escape(s)}/) }
    end

  end # Prompt

end # Shell
end # Console
end # Ui
end # Xss
