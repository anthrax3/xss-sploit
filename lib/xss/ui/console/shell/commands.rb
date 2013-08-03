#
# Dealing with commands
#
require 'xss/ui/console/shell/commands/help'
require 'xss/ui/console/shell/commands/show'
require 'xss/ui/console/shell/commands/exploit'
require 'xss/ui/console/shell/commands/payload'
require 'xss/ui/console/shell/commands/encoder'

module Xss
module Ui
module Console
module Shell
    module Commands

        def help
        end

        def show(cmd)
            _show = Xss::Ui::Console::Shell::Commands::Show.new

            case _show
                when cmd == _show.commands["all"]
                    puts "Allllll"
                when cmd == _show.commands["exploits"]
                    puts "exploitss"
                when cmd == _show.commands["payloads"]
                    puts "exploitss"
                when cmd == _show.commands["encoders"]
                    puts "encodersss"
                when cmd == _show.commands
                    puts "wiki"
                else
                    puts_debug "Unkown option"

            end

        end

        def exploit
        end

        def payload
        end

        def encoder
        end

        def wiki
        end

    end
end
end
end
end


