

module Xss
module Ui
module Console
module Shell
module Commands

  class Encoder

    attr_accessor :cmd_ary

    def initialize
      self.cmd_ary = commands.keys.sort
    end

    def name
      'Exploit'
    end

    # {command => Description}
    def self.info
      {'encoder' => 'Encoders for exploits to bypass filters'}
    end


    #
    # A hash of inner commands in exploit
    # The hash keys: payloads, run
    #
    def commands
      {
        'payload' => 'Show all available payloads.',
        'run' => 'Print the exploit with its payload.'
      }
    end

  end # Encoder

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
