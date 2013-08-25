#
# Prompt class is a core for console's shell prompt
#

module Xss
module Ui
module Console

  module Shell

    class Prompt
      include Xss::Ui::Console::Prints::Decoration

      def initialize
          require 'readline'
          @shell_config = Xss::Ui::Console::Shell::Config.new
      end

      #
      # Start prompt
      #
      def start

        begin
          while true
<<<<<<< HEAD
            line = ""
            @shell_config.tab_completion(line)
            line = Readline.readline('XSSploit'.light_white + ' -> '.red , true)
            @shell_config.history(line)
            @shell_config.run_command(line)
=======
              line = ""
              @shell_config.tab_completion(line)
              line = Readline.readline('XSSploit'.light_white + ' -> '.red , true)
              @shell_config.history(line)
              @shell_config.run_command(line)
>>>>>>> 61bee525805d0c94b1ec95c3f41d94005042eccf
          end
        rescue Interrupt
          puts_debug "Use 'exit' command to quite!"
          @shell_config.interrupt_control
          retry
        end

      end

    end # Prompt

  end # Shell
end # Console
end # Ui
end # Xss