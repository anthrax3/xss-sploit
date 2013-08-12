#
# Decoration module Decorate application outputs
#

module Xss
module Ui
module Console
module Prints

    module Decoration
        attr_reader :terminal_size

        # Terminal dimensions
        def terminal_size
            begin
                `stty size`.scan(/\d+/).map { |s| s.to_i }.reverse
            rescue
                puts_debug "I can't detect you commandline environment!"
            end
        end

        # Info print
        def puts_info(str = "")
            puts "\n[+]".green + "#{str}"
        end

        # Error print
        def puts_err(str = "")
           puts "\n[-] ".red + "#{str}"
        end

        # Debug print
        def puts_debug(str = "")
            puts "\n[!] ".light_yellow + "#{str}"
        end

        # Warning print
        def puts_fatal(str = "")
            puts "[!] ".colorize( :light_blue ).colorize( :background => :red ).blink + "#{str}".colorize( :light_blue ).colorize( :background => :red )
        end

    end # Decoration

end # Print
end # Console
end # Ui
end # XSS
