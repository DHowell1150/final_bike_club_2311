class Ride

  attr_reader :name, 
              :distance, 
              :terrain,
              :loop,
              :total_distance

  def initialize(data)
    @name = data[:name]
    @distance = data[:distance]
    @terrain = data[:terrain]
    @loop = false
    @total_distance = 21.4
  end

  def loop?
    @loop
  end
end