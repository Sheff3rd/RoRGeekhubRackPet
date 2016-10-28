class Tamagotchi
  attr_accessor :health, :feed_status, :drink_status, :sleep_status, :fun_status, :message, :dead

  def initialize
    @name = 'Совун'
    @feed_status = 50
    @drink_status = 50
    @sleep_status =50
    @fun_status = 50
    @illness =0
    health_calculate
    @dead = false
    is_dead

    @message = @name + ' народився.'
  end

  def feed
    @message = 'Ди годуєте ' + @name +'a.'

    @feed_status += 50
    @drink_status -= 10
    @sleep_status -= 10
    @fun_status -=10
    all_in_range
    health_calculate
    is_dead
  end

  def drink
    @message = 'Ви поїте ' + @name + 'a.'

    @feed_status -= 10
    @drink_status += 50
    @sleep_status -= 10
    @fun_status -=10
    all_in_range
    health_calculate
    is_dead
  end

  def sleep
    @message = @name + ' спить 10 хвилин.'

    @feed_status -= 10
    @drink_status -= 10
    @sleep_status += 50
    @fun_status -=10
    all_in_range
    health_calculate
    is_dead
  end

  def have_fun
    @message = 'Ви веселите ' + @name +'а.'

    @feed_status -=10
    @drink_status -= 10
    @sleep_status -= 10
    @fun_status += 50
    all_in_range
    health_calculate
    is_dead
  end

  private

  def health_calculate
    is_dead
    @health = (@feed_status + @drink_status + @sleep_status + @fun_status)/4 -  @illness
    @illness =0
  end

  def all_in_range
    @feed_status = in_range(@feed_status)
    @drink_status = in_range(@drink_status)
    @sleep_status = in_range(@sleep_status)
    @fun_status = in_range(@fun_status)
  end

  def in_range(variable)
    if variable>100
      variable = 100
      @illness +=10
    end

    if variable < 0
      variable = 0
      @illness +=10
    end
    variable
  end

  def is_dead
    if @health == 0
      @message = 'Ваш спутник помер'
      @dead = true
    end
  end
end
