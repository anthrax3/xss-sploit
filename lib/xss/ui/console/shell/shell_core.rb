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
          Readline.completion_case_fold = true
      end

      #
      # Start prompt
      #
      def start

        begin
          while true
            line = ""
            @shell_config.tab_complete#(line)

            line = Readline.readline('XSSploit'.light_white + ' -> '.red , true)

            break if line.nil?  # Control Ctrl^D
            @shell_config.history(line)
            @shell_config.run_command(line)
          end
        rescue Interrupt
          puts_debug "Use 'exit' command to quit!"
          retry
        end

      end

    end # Prompt

  end # Shell
end # Console
end # Ui
end # Xss