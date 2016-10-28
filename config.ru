require 'json'
require './tamagotchi.rb'

use Rack::Static, urls: ['/images'],
                  root: 'public'

class Pet
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when '/'
      @pet = Tamagotchi.new
      [200, { 'Content-Type' => 'text/html', 'Cache-Control' => 'public, max-age=86400' }, File.open('public/index.html', File::RDONLY)]
    when '/index.json'

      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.feed_status,
        drink_status: @pet.drink_status,
        sleep_status: @pet.sleep_status,
        fun_status: @pet.fun_status,
        message: @pet.message,
        image: '/images/index.jpg'
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/feed.json'
      @pet.feed
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.feed_status,
        drink_status: @pet.drink_status,
        sleep_status: @pet.sleep_status,
        fun_status: @pet.fun_status,
        message: @pet.message,
        image: '/images/feed.jpg'
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/drink.json'
      @pet.drink
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.feed_status,
        drink_status: @pet.drink_status,
        sleep_status: @pet.sleep_status,
        fun_status: @pet.fun_status,
        message: @pet.message,
        image: '/images/drink.jpg'
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/sleep.json'
      @pet.sleep
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.feed_status,
        drink_status: @pet.drink_status,
        sleep_status: @pet.sleep_status,
        fun_status: @pet.fun_status,
        message: @pet.message,
        image: '/images/sleep.jpg'
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    when '/have_fun.json'
      @pet.have_fun
      result = JSON.generate(
        health: @pet.health,
        feed_status: @pet.feed_status,
        drink_status: @pet.drink_status,
        sleep_status: @pet.sleep_status,
        fun_status: @pet.fun_status,
        message: @pet.message,
        image: '/images/fun.jpg'
      )
      [200, { 'Content-Type' => 'text/json' }, [result]]
    else
      not_found = JSON.generate(result: "Error 404. Page not found !")
      [404, { 'Content-Type' => 'text/json' }, [not_found]]
    end

  end
end

run Pet.new
# to run server 'rackup config.ru' in terminal
