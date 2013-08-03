

module Xss
module Ui
module Console

    module Shell
        attr_accessor :input, :output
        class Prompt
            #def initialize(tab_completion=nil)
            #    rl_tabcomp_engine(tab_completion)
            #    history = History.new
            #    @file = File.open(history.history_file, "a")
            #end

            #
            # Method which once called, will begin a readline prompt
            #
            def grab
                line = nil
                begin
                    line = ::Readline.readline(prm, true)
                    if not line =~ /^\s*$/
                        @file.puts(line)
                    end
                end
                return line
            end

            #
            # Tab_completion
            #
            def rl_tabcomp_engine(tab_completion)
                if (!tab_completion.nil?)
                    ::Readline.basic_word_break_characters = "\x00"
                    ::Readline.completion_proc = tab_completion
                end
            end

            def start
                begin
                    while true
                        line = input.grab
                        runcmd(line)
                    end
                rescue Interrupt
                    puts_debug "Use 'exit' command to quite!"
                end
            end
        end # Prompt
    end # Shell

end # Console
end # Ui
end # Xss