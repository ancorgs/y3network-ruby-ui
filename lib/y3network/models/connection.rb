module Y3Network
  module Models
    class Connection
      attr_reader :name
      attr_reader :start_mode

      def initialize(string)
        @name, @start_mode = string.split(":").map(&:strip)
      end
    end
  end
end
