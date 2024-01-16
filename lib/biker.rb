class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end
  
  def log_ride(rider, time)
    @rides[rider] ||= []
    @rides[rider] << time
  end

  def personal_record(ride)
    pr = nil
    @rides[ride].each do |time|
      pr = time if pr.nil? || time < pr
    end
    # @rides.each do |hash_ride, times|
    #   times.max_by do |time|
    #   pr = time
    #   end
    # end
    pr
  end
end
