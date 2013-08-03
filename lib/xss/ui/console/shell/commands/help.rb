module Xss
module Ui
module Console
module Shell
module Commands

    class Help
        include Xss::Ui::Console::Shell::Commands

        def name
            "Help"
        end

        #
        # A hash of inner commands in help
        #
        def commands
            {

            }
        end

    end # Help

end # Commands
end # Shell
end # Console
end # Ui
end # Xss