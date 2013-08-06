#
# This class a central class for general console configurations
#

module Xss
module Ui
module Console
module Shell

    class Config

        def initialize
            _history = Xss::Ui::Console::Shell::History.new
            @file     = File.open(_history.history_file, 'a')
        end

        def history(line)
            #_history = Xss::Ui::Console::Shell::History.new
            #file     = File.open(_history.history_file, 'a')

            @file.puts(line)
        end

        #
        # Controls Ctrl+^C interruption
        #
        def interrupt
            stty_save = `stty -g`.chomp!
            trap('INT', 'SIG_IGN')
            system('stty', stty_save)
        end


        #
        # Tab completion settings
        #
        def tab_completion#(tab_completion)
            #if (!tab_completion.nil?)
                ::Readline.completion_append_character = " "
                ::Readline.basic_word_break_characters = "\x00"
                #::Readline.completion_proc = tab_completion
            #end
        end

        #
        # Exit question control
        #
        def sure_exit?(line)
            if line =~ /^quit|^exit/

                print "\nAre you sure?[n]: "
                if Readline.readline =~ /^y$|^yes$/i
                    exit
                end

            end
        end

    end

end # Shell
end # Console
end # Ui
end # Xss
