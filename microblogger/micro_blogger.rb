require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length > 140
      puts "Tweet is too long"
    else
      @client.update(message)
    end
  end
  def run
    puts "Welcome to the JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      command = gets.chomp
    case command
      when 'q' then puts "Goodbye!"
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end

  end
end

blogger = MicroBlogger.new
blogger.run
