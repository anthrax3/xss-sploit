module Xss
module Ui
module Console
module Shell
module Commands

  class Wiki
    include Xss::Ui::Console::Shell::Commands

    def name
      'Wiki'
    end

    # {command => Description}
    def self.info
      {'wiki' => 'List most useful complete exploits'}
    end

    # Command usage
    def self.usage
      puts %q{Usage: wiki}
    end


    #
    # A hash of inner commands in exploit
    # The hash keys:
    #
    def commands
      {

      }
    end

    #
    # Just what the command use to do
    #
    def action
      puts "wiki command!"
    end

  end

end
end
end
end
end
