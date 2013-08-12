#
# Reader class to read all kind of inputs including tab, enter
#

module Xss
module Ui
module Console
module Shell
    class Reader
        attr_accessor :prm

        #
        # Tab completion settings
        #
        def tab_comp(tab_completion)
          if (!tab_completion.nil?)
            ::Readline.completion_append_character = " "
            ::Readline.basic_word_break_characters = "\x00"
            ::Readline.completion_proc = tab_completion
          end
        end

    end
end # Shell
end # Console
end # Ui
end # Xss
