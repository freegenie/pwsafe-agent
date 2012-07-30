require 'socket'
require 'pathname' 
require 'logger'

require_relative './driver'


module Pwsafe 
  module Agent 
    
    BASE_DIR      = '~/.pwsafe-agent'
    SOCKET_PATH   = File.expand_path(File.join(BASE_DIR, 'socket'))
    TMP_FILE_PATH = File.expand_path(File.join(BASE_DIR, 'tmp'))
    PWSAFE        = ENV['PWSAFE_COMMAND'] || 'pwsafe'
        
    class Client
      def initialize(args)
        system 'pwsafe-agent'
        @args = args
      end

      def driver 
        @driver ||= Driver.new
      end

      def print_temp_file
        puts File.read(TMP_FILE_PATH)
      end

      def remove_temp_file
        system "rm #{TMP_FILE_PATH}" 
      end

      def command 
        password = driver.get
        "echo '#{password}' | #{PWSAFE} -E --output=#{TMP_FILE_PATH} #{stringified_args} > /dev/null"
      end

      def pwsafe_run
        if system(command)
          print_temp_file
          remove_temp_file
        else 
          puts "Some error occurred during command" 
          driver.flush
        end
      end

      def run 
        if @args.delete('--flush')
          driver.flush
        end

        pwsafe_run 
      end

      def stringified_args
        @args.join ' ' 
      end
  
    end
  end
end