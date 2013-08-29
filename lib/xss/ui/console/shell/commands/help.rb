module Xss
module Ui
module Console
module Shell
module Commands

  class Help

      attr_accessor :cmd_ary

      def initialize
        self.cmd_ary = commands.keys.sort
      end

      def name
        'Help'
      end

      #
      # A hash of inner commands in help
      #
      def commands
        {
          '?'    => 'Help menu - Show This screen',
          'show' => 'Displays modules of a given type, or all modules',
          'use'  => 'Selects a module by name',
          'help' => 'Help menu - Show This screen',
          'exit' => 'Exit the console'
        }
      end

      #
      # Just what the command use to do
      #
      def action
        puts "\nHelp menu"
        puts '=' * 'Help menu'.length + "\n\n"
        puts "Command \t\t Description"
        puts '-' * 'Command'.length + " \t\t " + '-' * 'Description'.length
        cmd_ary.each {|key| puts "#{key} \t\t #{commands[key]}"}
        puts "\n\n"
      end

  end # Help

end # Commands
end # Shell
end # Console
end # Ui
end # Xss