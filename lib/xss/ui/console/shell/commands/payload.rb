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
        # The inner commands in show
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

    end

end
end
end
end
end
