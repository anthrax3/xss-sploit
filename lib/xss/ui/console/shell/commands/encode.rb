

module Xss
module Ui
module Console
module Shell
module Commands

  class Encode

    attr_accessor :cmd_ary

    def initialize
      self.cmd_ary = commands.keys.sort
    end

    #
    # Contains command information
    # @return [Hash] {command => Description}
    #
    def self.info
      {'encode' => 'Encodes exploits to bypass filters'}
    end

    # Command usage
    def self.usage
      puts "usage: "
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

    def action
      puts "Encoder command!"
    end

  end # Encoder

end # Commands
end # Shell
end # Console
end # Ui
end # Xss
