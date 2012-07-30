module Pwsafe
  module Agent
    class Driver
      def initialize
        @password = nil
      end

      def set 
        UNIXSocket.open(SOCKET_PATH) do |sock| 
          puts "type password"
          begin 
            system 'stty -echo' 
            password = STDIN.gets.chomp 
          ensure 
            system 'stty echo' 
          end
          sock.write "SET=#{password}" 
          sock.close_write

          @password = sock.read
          sock.close
        end
      end

      def flush 
        UNIXSocket.open(SOCKET_PATH) do |sock| 
          sock.write "FLUSH"
          sock.close
        end
      end

      def blank_password? 
        @password == ''
      end

      def get 
        UNIXSocket.open(SOCKET_PATH) do |sock| 
          sock.write 'GET'
          sock.close_write

          @password = sock.read
          sock.close
        end

        set if blank_password? 
        @password
      end
    end
  end
end