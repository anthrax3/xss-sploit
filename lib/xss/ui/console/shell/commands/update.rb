module Xss
module Ui
module Console
module Shell
module Commands

  class Update
    #include Xss::Ui::Console::Shell::Commands

    attr_accessor :cmd_ary

    def initialize
      self.cmd_ary = commands.keys.sort
    end

    def name
      'Update'
    end
    # {command => Description}
    def self.info
      {'update' => 'Update framework'}
    end


    #
    # A hash of inner commands in update
    #
    def commands
      {}
    end

    #
    # Just what the command use to do
    #
    def action
      begin
        if 1.integer? # git must check if there is a changes in the repository
          puts "Update command"
        else
          puts_info "Starting update"
          #system("git clone https://github.com/KINGSABRI/xss-sploit.git")
          puts_info "Done!, please re-run XSSploit"
        end
      rescue
        puts ""
      end
    end

  end # Help

end # Commands
end # Shell
end # Console
end # Ui
end # Xss