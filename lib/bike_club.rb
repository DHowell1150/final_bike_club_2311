class BikeClub
  attr_reader :name

  def initialize(name)
    @name = name
    @bikers = []
  end

  def bored_biker
    require 'pry' ; binding.pry
  end
end