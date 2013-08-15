#
# Operator class to
#

module Xss
module Ui
module Console
module Shell
    class Operator
      
      attr_accessor :activity_stack
      
      def initialize
        self.activity_stack = []
      end
      
      def remove_activity_stack_item
        activity_stack.pop if !(activity_stack.first == Commands)
      end
      
      def add_actiivity_stack_item(activity_item)
        activity_stack.push(activity_item.new(self))
      end

    end # Operator
end # Shell
end # Console
end # Ui
end # Xss
