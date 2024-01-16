class BikeClub
  attr_reader :name,
              :bikers,
              :eligible_bikers

  def initialize(name)
    @name = name
    @bikers = []
    @eligible_bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end
  def most_rides
    @bikers.max do |biker|
      # biker.rides.each do |ride|
        return biker.name if biker.rides.values.count

      # end
    end
  end


  # def biker_eligible
  #   @eligible_bikers << biker if 
  # end
end