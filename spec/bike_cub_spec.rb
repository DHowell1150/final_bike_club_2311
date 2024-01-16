
RSpec.describe Bike_club do
  before do
    @bike_club = BikeClub.new("Climbers")
  end

  it 'exists' do
    expect(@bike_club).to be_a(Bike_club)
  end

  it 'has readable attributes' do
    expect(@bike_club.name).to eq("Climbers")
    expect(@bike_club.bikers).to eq([])
  end
end