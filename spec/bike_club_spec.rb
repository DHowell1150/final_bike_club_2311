require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'pry'
RSpec.describe BikeClub do
  before do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    #<Ride:0x00007fc62ca32a10...>
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @bike_club = BikeClub.new("Climbers")
  end

  it 'exists' do
    expect(@bike_club).to be_a(BikeClub)
  end

  it 'has readable attributes' do
    expect(@bike_club.name).to eq("Climbers")
    expect(@bike_club.bikers).to eq([])
  end

  describe '#add_bikers' do
    it 'Can add bikers to club' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)

      expect(@bike_club.bikers).to eq([@biker, @biker2])
    end
  end

  describe '#most_rides' do
    it '#tells us which biker has the most rides' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)

      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      
      @biker.log_ride(@ride2, 50.0)
      @biker2.log_ride(@ride1, 61.6)
      @biker2.log_ride(@ride2, 61.6)


      expect(@bike_club.most_rides).to eq("Athena")
    end
  end

  describe '#best_time_ride' do
    it ' can tell which biker has the best time for a given ride' do
      @bike_club.add_biker(@biker)
      @bike_club.add_biker(@biker2)

      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      
      @biker.log_ride(@ride2, 50.0)
      @biker2.log_ride(@ride1, 61.6)
      @biker2.log_ride(@ride2, 61.6)

      expect(@bike_club.best_time(@ride1)).to eq(@biker2)
    end
  end
end