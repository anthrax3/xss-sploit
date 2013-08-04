module Xss
module Ui
module Console

    module Shell
    #    attr_accessor :prm_title
    #
    #    class Prompt
    #        #def initialize(tab_completion=nil)
    #        #    rl_tabcomp_engine(tab_completion)
    #        #    history = History.new
    #        #    @file = File.open(history.history_file, "a")
    #        #end
    #
    #        #
    #        # Tab_completion
    #        #
    #        def tab_completion(tab_completion)
    #            if (!tab_completion.nil?)
    #                ::Readline.completion_append_character = " "
    #                ::Readline.basic_word_break_characters = "\x00"
    #                ::Readline.completion_proc = tab_completion
    #            end
    #        end
    #
    #        #
    #        # Console title
    #        #
    #        def self.prm_title(title = nil)
    #            if title.nil?
    #                return "->"
    #            else
    #                return "#{title} ->"
    #            end
    #        end
    #
    #
    #        #
    #        # Method which once called, will begin a readline prompt
    #        #
    #        def grab
    #            line = nil
    #            begin
    #                line = ::Readline.readline(:prm_title, true)
    #                if not line =~ /^\s*$/
    #                    @file.puts(line)
    #                end
    #            end
    #            return line
    #        end
    #
    #        #
    #        # Start console engine
    #        #
    #        def start
    #            begin
    #                while true
    #                    line = grab
    #
    #                    if line =~ /^quit|^exit/
    #                        print "\nAre you sure? "
    #                        if Readline.readline =~ /^y$|^yes$/i
    #                            exit
    #                        end
    #                    end
    #                end
    #            rescue Interrupt
    #                system('stty', stty_save)
    #                puts_debug "Use 'exit' command to quite!"
    #            end
    #        end
    #    end # Prompt
    #end # Shell

    class Prompt

        def initialize
            require 'readline'

            @stty_save = `stty -g`.chomp!
            trap('INT', 'SIG_IGN')
        end

        def history

        end

        def start
            begin
                ::Readline.completion_append_character = " "
                while true
                    line = Readline.readline("-> ".dark_red , true)

                    # Exit control
                    if line =~ /^quit|^exit/
                        print "\nAre you sure?[n]: "
                        if Readline.readline =~ /^y$|^yes$/i
                            exit
                        end

                    end
                end
            rescue Interrupt
                system('stty', @stty_save)
                puts_debug "Use 'exit' command to quite!"
            end

        end
    end

    end # Shell
end # Console
end # Ui
end # Xss