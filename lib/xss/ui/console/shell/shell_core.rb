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
                        line = Readline.readline("-> ".red , true)
                        #@file.puts(line)
                        @shell_config.history(line)
                        @shell_config.sure_exit?(line)

                    end
                rescue Interrupt
                    puts_debug "Use 'exit' command to quite!"
                    @shell_config.interrupt
                    retry
                end

            end
        end

    end # Shell
end # Console
end # Ui
end # Xss