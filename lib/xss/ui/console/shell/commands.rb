#
# CommandsCore module calling all commands
#
require 'xss/ui/console/shell/commands/help'
require 'xss/ui/console/shell/commands/show'
require 'xss/ui/console/shell/commands/update'
#require 'xss/ui/console/shell/commands/exploit'
#require 'xss/ui/console/shell/commands/payload'
#require 'xss/ui/console/shell/commands/encoder'


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
        #@help   = Help.new
        #@show   = Show.new
        #@update = Update.new

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

      # Help menu
      #def cmd_help(*cmds)
      #  @help.action
      #end
      #alias cmd_? :cmd_help

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

      #def cmd_back(*cmds)
      #  puts 'Back one step and clear activity stack'
      #end
      #
      ## Update framework
      #def cmd_update(*cmds)
      #  @update.action
      #end

      #                               #
      # External framework's Commands #
      #                               #

      COMMANSDLIST.each do |cmd|
        define_method("cmd_#{cmd}") do |*arg|
          # 1st try metaprogramming
          #var = instance_variable_get("@#{cmd}")
          #var.action
          #instance_variable_get("@#{cmd}").send(Object.const_get("#{cmd}".capitalize!).new.action)
          #instance_variable_get("@#{cmd}").send(Object.const_get("Xss::Ui::Console::Shell::Commands::" + "#{cmd}".capitalize!).new.action)
          instance_variable_get("@#{cmd}").send(Xss::Ui::Console::Shell::Commands.const_get("#{cmd}".capitalize!).new.action)


        end
      end
      alias cmd_? :cmd_help

      #def cmd_show(*cmds)
      #    @show.action
      #end
      #
      #def use
      #    puts 'use command executed!!'
      #end
      #
      #def cmd_exploit(*cmds)
      #    puts 'exploit command executed!!'
      #end
      #
      #def cmd_payload(*cmds)
      #    puts 'payload command executed!!'
      #end
      #
      #def cmd_encoder
      #end
      #
      #def cmd_wiki
      #end

  end
end # Commands
end
end
end
end



