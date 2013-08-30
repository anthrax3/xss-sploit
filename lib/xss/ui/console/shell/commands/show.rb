module Xss
module Ui
module Console
module Shell
module Commands

    class Show

        attr_accessor :cmd_ary

        def initialize
          self.cmd_ary = commands.keys.sort
        end

        def name
          'Show'
        end
        # {command => Description}
        def self.info
          {'show' => 'Displays modules of a given type, or all modules'}
        end

        #
        # A hash of inner commands in show
        # The hash keys: all, exploits, @param[payloads], encoders, wiki
        #
        def commands
          {
                  'all' => 'Show all available exploits, payloads and encoders.',
                  'exploits' => 'Show all available exploits.',
                  'payloads' => 'Show all available payloads.',
                  'encoders' => 'Show all available encoders.',
                  'wiki' => 'Show the wiki.'
          }
        end

        #
        # Just what the command use to do
        #
      def action
        puts "To be fixed\n\n"
        _show = case
            when _show == nil
                puts commands
            #when _show.commands["exploits"]
            #    puts "Call exploitss"
            #when _show.commands["payloads"]
            #    puts "Call exploitss"
            #when _show.commands["encoders"]
            #    puts "Call encodersss"
            #when _show.commands
            #    puts "Call wiki"
            else
                puts_debug 'Unkown option'

        end
        puts "\n\n"
      end

    end # Show

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
