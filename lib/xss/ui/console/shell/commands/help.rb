#require 'lib/xss/ui/console/shell/commands'

module Xss
module Ui
module Console
module Shell
module Commands

  class Help

      attr_accessor :cmd_ary

      def initialize
        #@commands = CommandsCore::COMMANDSLIST
        @commands = CommandsCore.instance_methods(false).map do |c|
          next unless c.to_s.include? "cmd_"
          c.to_s.split("_").last
        end.delete_if {|e| e.nil?}.sort!

        self.cmd_ary = commands.keys.sort
      end

      # {command => Description}
      def self.info
        {'help' => 'Help menu - Show This screen'}
      end

      def self.usage
        puts "WTF! Are you asking help for help?!"
      end

      #
      # A hash of inner commands in help
      #
      def commands
        help_list = {}
        @commands.map do |cmd|
          info = Commands.const_get("#{cmd}".capitalize!).info   #=> {"cmd"=>"Description"}
          help_list[info.keys.first] = info.values.first
        end
        return help_list
      end

      #
      # Just what the command use to do
      #
      def action
        puts "\nHelp menu"
        puts '=' * 'Help menu'.length + "\n\n"
        puts "   Command \t Description"
        puts "   " + '-' * 'Command'.length + " \t " + '-' * 'Description'.length
        commands.map {|cmd , desc| puts "   #{cmd}    \t #{desc}"}
        puts "\n\n"
      end

  end # Help

end # Commands
end # Shell
end # Console
end # Ui
end # Xss