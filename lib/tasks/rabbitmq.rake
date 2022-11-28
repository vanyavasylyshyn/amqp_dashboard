namespace :rabbitmq do
  desc "Connect consumer to producer"
  task :setup do
    require "bunny"

    connection = Bunny.new.tap(&:start)
    channel = connection.create_channel

    queue_restaurants = channel.queue("dashboard.restaurants", durable: true)
    queue_restaurants.bind("producer.restaurants")

    connection.close
  end
end