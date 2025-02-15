require './lib/ride'
require './lib/biker'
require 'pry'

RSpec.describe Biker do
  before do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
   #<Ride:0x00007fc62ca32a10...>
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
   #<Ride:0x00007fc62cb42ba8...>
  end

  it 'exists' do
    expect(@biker).to be_a(Biker)
  end

  it 'has readable attributes' do
    expect(@biker.name).to eq("Kenny")
    expect(@biker.max_distance).to eq(30)
    expect(@biker.rides).to eq({})
    expect(@biker.acceptable_terrain).to eq([])
  end

  describe 'learn_terrain!' do
    it 'can learn a new terrain' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe 'log_ride' do
    it 'logs the rides of each biker in a hash with biker as key and rides in an array.' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      
      expect(@biker.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})
    end
  end

  describe '#personal_record' do
    it 'can find fastest time from rides' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)

      @biker2.log_ride(@ride1, 97.0) #biker2 doesn't know this terrain yet
      @biker2.log_ride(@ride2, 67.0) #biker2 doesn't know this terrain yet
      expect(@biker2.rides).to eq({})
  
  
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0) # biker2 can't bike this distance
      @biker2.log_ride(@ride2, 65.0) # biker2 knows this terrain and can bike this distance
      expect(@biker2.rides).to eq({@ride2 => [65.0]})
      #=> { #<Ride:0x00007fc62cb42ba8...> => [65.0] }
      
      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      
      expect(@biker2.personal_record(@ride1)).to be false
    end

  end
end
