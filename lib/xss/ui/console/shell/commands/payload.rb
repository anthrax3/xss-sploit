module Xss
module Ui
module Console
module Shell
module Commands

    class Payload
        include Xss::Ui::Console::Shell::Commands

        def name
            "Show"
        end

        #
        # A hash of inner commands in payload
        #
        def commands
            {
                    "all"      => "Show all available exploits, payloads and encoders.",
                    "exploits" => "Show all available exploits.",
                    "payloads" => "Show all available payloads.",
                    "encoders" => "Show all available encoders.",
                    "wiki"     => "Show the wiki."
            }
        end

    end # Payload

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
