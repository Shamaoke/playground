
module Rack
  module Handler
    class Thin
      def self.run(app, **options)

        p options

        host = options.delete(:Host) || '192.168.1.0'
        port = options.delete(:Port) || 8080

        require 'pry'; binding.pry

        puts host, port

      end
    end
  end
end

options = { :Host => '0.0.0.0', :Port=> 2500 }

server = Rack::Handler::Thin.run nil, **options

