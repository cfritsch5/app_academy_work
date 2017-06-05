# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue
    return nil
   retry
 end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < StandardError
  def message
    puts "Not a fruit, but coffee is fine"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    if maybe_fruit == "coffee"
      raise CoffeeError
    else
      raise StandardError
    end
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError
    retry
  end
end

class FakeFriendError < StandardError
  def message
    puts "real friendships last 5+ years"
  end
end

class PoorFriendError < StandardError
  def message
    puts "real friends tell each other things"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise FakeFriendError if @yrs_known < 5
    raise PoorFriendError if [name, fav_pastime].any? {|str| str.length == 0}
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
