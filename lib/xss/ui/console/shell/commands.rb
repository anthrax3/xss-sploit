#
# CommandsCore module calling all commands
#
COMMANDSLIST = Dir.glob("lib/xss/ui/console/shell/commands/*").map {|cmd| cmd.split("/").last.gsub(".rb" , "")}
COMMANDSLIST.each do |lib|
  require "xss/ui/console/shell/commands/#{lib}"
end


module Xss
module Ui
module Console
module Shell
module Commands
    class CommandsCore
      attr_accessor  :sub_commands

      def initialize(operator)
        @operator = operator
        #@sub_cmds_instance = {}
      end

      #                      #
      # framework's Commands #
      #                      #

      #
      # Automatically, Instantiates all commands' methods with its action.
      #=== Example
      # def cmd_commandName(cmd*)
      #   @commandName = CommandNameClass.new.action
      #   @commandName.action
      # end
      #
      COMMANDSLIST.each do |cmd|
        define_method("cmd_#{cmd}") do |*arg|
          obj = instance_variable_get("@#{cmd}") #@cmd , we'll need it to call sub-commands
          command_obj = Xss::Ui::Console::Shell::Commands.const_get("#{cmd}".capitalize!).new#.action #@cmd.action
          command_obj.action
          # sub_commands is an [Array] contains all sub commands of the command
          self.sub_commands = Xss::Ui::Console::Shell::Commands.const_get("#{cmd}".capitalize!).new.sub_cmd_ary
        end
      end
      #alias cmd_? :cmd_help
      #alias :cmd_quit :cmd_exit  #TODO I have an issue to call aliases from help :(


      #def sub_commands(cmd)
      #   @sub_cmds_instance
      #end

  end # CommandsCore
end # Commands
end # Shell
end # Console
end # Ui
end # Xss



