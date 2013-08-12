#
# Config class a central placeholder for general console configurations
#
require 'xss/ui/console/shell/commands'

module Xss
module Ui
module Console
module Shell

    class Config
        include Xss::Ui::Console::Shell::Commands

        attr_accessor :input, :prm

        def initialize
            @_history = Xss::Ui::Console::Shell::History.new
            @file     = File.open(@_history.history_file, 'a')
            #self.input = input || Reader.new(lambda {|cmd| tabbed_comp(cmd)})
        end

        def history(line)

            @file.puts(line) if !@_history.line_repeated?(line)

        end

        #
        #
        #
        def grab
            line = nil
            begin
                line = ::Readline.readline(prm, true)
            end
        end


        #
        # To change title to prompt title after use an exploit or encoder
        # TODO: MAKE SURE EXPLOIT IS EXIST AND ONLY EXPLOITS AND ENCODERS CAN CHANGE THE TITLE
        #def mod_prm(prm=nil)
        #    dup_prm = "#{self.input.prm.dup}"
        #
        #    if (prm)
        #        new_prm = "#{self.prm} #{prm}#{pchar} "
        #        test    =  dup_prm.gsub!("#{self.input.prm}", "#{new_prm}")
        #        self.input.prm = "#{test}"
        #    end
        #
        #    input.input_line = "#{test}" if input.respond_to?('input_line')
        #end

        #
        # To check if the entered line is command or not from Commands class
        #
        def is_command?(cmd)
            if self.respond_to?("cmd_#{cmd}")
                return true
            else
                return false
            end
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

    end # Prompt

end # Shell
end # Console
end # Ui
end # Xss
