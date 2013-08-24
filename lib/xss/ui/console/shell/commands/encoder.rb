

module Xss
module Ui
module Console
module Shell
module Commands

  class Encoder
      include Xss::Ui::Console::Shell::Commands

      def name
        'Exploit'
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
