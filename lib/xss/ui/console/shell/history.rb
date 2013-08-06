#
# This module for managing console history;
# This class from WXF framework
#

module Xss
module Ui
module Console
module Shell

    class History

        attr_accessor :history_file

        def initialize
            history_file_init
        end

        #
        # Create/Initiate .history file if not exist
        #
        def history_file_init

            self.history_file = "#{XSSDIR}/.history"

            if ! ::File.exists?("#{self.history_file}")
                File.new("#{self.history_file}", "w+")
            end

            hist_file
        end

        def hist_file
            hfile =  File.open("#{self.history_file}", "r")
            hfile.each do |line|
                line.chomp!
                ::Readline::HISTORY.push(line)
            end
            hfile.close
        end


    end

end
end
end
end
