#
# CommandsCore module calling all commands
#
require 'xss/ui/console/shell/commands/help'
require 'xss/ui/console/shell/commands/show'
require 'xss/ui/console/shell/commands/use'
require 'xss/ui/console/shell/commands/update'
require 'xss/ui/console/shell/commands/exploit'
require 'xss/ui/console/shell/commands/payload'
require 'xss/ui/console/shell/commands/encoder'
require 'xss/ui/console/shell/commands/wiki'


module Xss
module Ui
module Console
module Shell
module Commands
    class CommandsCore
      COMMANSDLIST = Dir.glob("lib/xss/ui/console/shell/commands/*").map {|cmd| cmd.split("/").last.gsub(".rb" , "")}
      attr_accessor :sub_commands

      def initialize(operator)
        @operator = operator
      end

      def self.sub_commands(cmd = nil)
          subCommandsOf =
          {
                  'help' => @help.cmd_ary,
                  'show' => @show.cmd_ary
          }

          return subCommandsOf[cmd] if not nil?
      end

      #                           #
      # Core framework's Commands #
      #                           #

      # Exit command & its control
      def cmd_exit(*cmds)
        # TODO just commented temp
        #print "\nAre you sure?[n]: "
        #if Readline.readline =~ /^y$|^yes$/i
            puts "See you soon ;)\n\n"
            exit
        #end
      end
      alias :cmd_quit :cmd_exit


      #                               #
      # External framework's Commands #
      #                               #

      COMMANSDLIST.each do |cmd|
        define_method("cmd_#{cmd}") do |*arg|
          obj = instance_variable_get("@#{cmd}") #@cmd
          obj = Xss::Ui::Console::Shell::Commands.const_get("#{cmd}".capitalize!).new.action #@cmd.action
        end
      end
      alias cmd_? :cmd_help

  end # CommandsCore
end # Commands
end # Shell
end # Console
end # Ui
end # Xss



