class Tamagotchi

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @start_time = Time.new()
    @check_in_time=@start_time
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:age) do
    age = Time.new() - @start_time
    days = 0
    minutes = 0
    seconds = 0
    until age.floor.==(0)
      days = age./(86400).floor
      age = age%86400
      minutes = age./(60).floor
      age = age%60
      seconds = age.floor
      age = age%1
    end
    age = "Your Tamagotchi has been alive for: #{days} days, #{minutes} minutes, and #{seconds} seconds"
  end

  define_method(:feed) do
    if @food_level<10
      @food_level+=1
      @check_in_time=Time.new()
      @name.concat(" was so hungry! Thanks for feeding them! Your food level is #{@food_level}")
    else
    end
  end

  define_method(:rest) do
    if @sleep_level<10
      @sleep_level+=1
      @check_in_time=Time.new()
      @name.concat(" was so tired! Thanks for letting them rest! Your sleep level is #{@sleep_level}")
    else
    end
  end

  define_method(:run_around) do
    if @food_level<10
      @food_level+=1
      @check_in_time=Time.new()
      @name.concat(" was getting unhappy! Thanks for playing with them! Your activity level is #{@activity_level}")
    else
    end
  end

  define_method(:check_in) do
    time_since_check_in = Time.new() - @check_in_time
    if time_since_check_in >= 180
      self.decrement(10)
    elsif time_since_check_in >= 162
      self.decrement(9)
    elsif time_since_check_in >= 144
      self.decrement(8)
    elsif time_since_check_in >= 126
      self.decrement(7)
    elsif time_since_check_in >= 108
      self.decrement(6)
    elsif time_since_check_in >= 90
      self.decrement(5)
    elsif time_since_check_in >= 72
      self.decrement(4)
    elsif time_since_check_in >= 54
      self.decrement(3)
    elsif time_since_check_in >= 36
      self.decrement(2)
    elsif time_since_check_in >= 18
      self.decrement(1)
    end
  end

  define_method(:alive?) do
    if @food_level.<(1) || @sleep_level.<(1)
      "You killed ".concat(@name).concat("!")
    else
      "Your pet is still alive!!!.....for now.\n
      food level: #{@food_level} \n
      @sleep_level: #{@sleep_level}"
    end
  end

  define_method(:decrement) do |time|
    @food_level-=time
    @sleep_level-=time
    @activity_level-=time
  end

  define_method(:kill) do
    @food_level = 0
  end

end
