require 'y3network/presenters/profile'

module Y3Network
  module Views
    class Profile
      include Glimmer

      def initialize
        @profile = Presenters::Profile.new
      end

      def open
        tk_root.open
      end

      protected

      attr_reader :profile

      def tk_root
        root {
          title 'Profile'

          frame {        
            grid column: 0, row: 0, padx: 5, pady: 5

            list {
              selectmode 'browse'
              selection bind(profile, :connection)
            }
          }
        }
      end
    end
  end
end
