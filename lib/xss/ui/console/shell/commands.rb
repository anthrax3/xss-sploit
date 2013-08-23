#
# CommandsCore module calling all commands
#
require 'xss/ui/console/shell/commands/help'
require 'xss/ui/console/shell/commands/show'
#require 'xss/ui/console/shell/commands/exploit'
#require 'xss/ui/console/shell/commands/payload'
#require 'xss/ui/console/shell/commands/encoder'


module Xss
module Ui
module Console
module Shell
    class CommandsCore

        attr_accessor :sub_commands

        def initialize(operator)
            @operator = operator
            @help = Xss::Ui::Console::Shell::Commands::Help.new
            @show = Xss::Ui::Console::Shell::Commands::Show.new
        end

        def self.sub_commands(cmd)
            subCommandsOf =
            {
                    'help' => @help.cmd_ary,
                    'show' => @show.cmd_ary
            }

            return subCommandsOf[cmd]
        end

        #                           #
        # Core framework's Commands #
        #                           #

        # Help menu
        def cmd_help(*cmds)
            @help.action
        end

        # Exit command & its control
        def cmd_exit(*cmds)
            # TODO just commented temp
            #print "\nAre you sure?[n]: "
            #if Readline.readline =~ /^y$|^yes$/i
                puts "See you soon ;)\n\n"
                exit
            #end
        end
        alias :cmd_quit :cmd_exit

        def cmd_back(*cmd)
            puts 'Back one step and clear activity stack'
        end


        #                               #
        # External framework's Commands #
        #                               #

        def cmd_show(*cmds)
            @show.action
        end

        def use
            puts 'use command executed!!'
        end

        def cmd_exploit(*cmds)
            puts 'exploit command executed!!'
        end

        def cmd_payload(*cmds)
            puts 'payload command executed!!'
        end

        def cmd_encoder
        end

        def cmd_wiki
        end

    end

end
end
end
end



