require "listen"
require "y3network/models/connection"

module Y3Network
  module Presenters
    class Profile
      DIRECTORY = File.expand_path('../../data/connections', __FILE__)

      attr_accessor :connection_options
      attr_accessor :connection

      def initialize
        listener =  Listen.to(DIRECTORY) do |_m, _a, _r|
          self.connection_options = read_connections
        end
        self.connection_options = read_connections
        self.connection = connection_options.first
        listener.start
      end

      def read_connections
        files_list.map do |filename|
          conn = Models::Connection.new(IO.readlines(filename).first)
          "#{conn.name} - #{conn.start_mode}"
        end
      end

      def files_list
        Dir[File.join(DIRECTORY, '**', '*')].select { |file| File.file?(file) }.sort
      rescue
        []
      end
    end
  end
end
