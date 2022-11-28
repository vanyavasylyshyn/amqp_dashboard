class RestaurantsWorker
  include Sneakers::Worker

  from_queue "dashboard.restaurants", env: nil
  def work(raw_restaurant)
    Restaurant.push(raw_restaurant)
    ack!
  end
end