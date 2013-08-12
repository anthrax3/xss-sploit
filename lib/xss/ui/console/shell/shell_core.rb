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
                @shell_config.tab_completion
            end

            #
            # Start prompt
            #
            def start

                begin
                    while true
                        line = Readline.readline("XSSploit".light_white + " -> ".red , true)
                        @shell_config.history(line)
                        @shell_config.sure_exit?(line)
                        puts @shell_config.is_command?(line)

                    end
                rescue Interrupt
                    puts_debug "Use 'exit' command to quite!"
                    @shell_config.interrupt
                    retry
                end

            end

        end # Prompt

    end # Shell
end # Console
end # Ui
end # Xss