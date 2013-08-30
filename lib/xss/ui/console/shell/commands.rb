#
# CommandsCore module calling all commands
#

%w{exploit payload encoder update help show use wiki set}.each do |lib|
  require "xss/ui/console/shell/commands/#{lib}"
end

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
              'help'    => @help.cmd_ary,
              'show'    => @show.cmd_ary,
              'use'     => @use.cmd_ary,
              'exploit' => @exploit.cmd_ary,
              'payload' => @payload.cmd_ary,
              'wiki'    => @wiki.cmd_ary,
              'update'  => @update.cmd_ary
          }

          return subCommandsOf[cmd] if not nil?
      end

      #                           #
      # Core framework's Commands #
      #                           #

      # Exit command & its control
      def cmd_exit(*cmd)
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



