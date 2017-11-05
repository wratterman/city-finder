class DisplayCity
  attr_reader :id, :name, :population, :violent_crime, :violent_crime_rate,
              :murder_manslaughter, :murder_manslaughter_rate, :rape,
              :rape_rate, :robbery, :robbery_rate, :aggrevated_assault,
              :aggrevated_assault_rate, :property_crime, :property_crime_rate,
              :burglary, :burglary_rate, :larceny_theft, :larceny_theft_rate,
              :motor_vehicle_theft, :motor_vehicle_theft_rate, :state_id

  def initialize(city)
    @id  = city[:id]
    @name = city[:name]
    @population = city[:population]
    @violent_crime = city[:violent_crime]
    @violent_crime_rate = city[:violent_crime_rate]
    @murder_manslaughter = city[:murder_manslaughter]
    @murder_manslaughter_rate = city[:murder_manslaughter_rate]
    @rape = city[:rape]
    @rape_rate = city[:rape_rate]
    @robbery = city[:robbery]
    @robbery_rate = city[:robbery_rate]
    @aggrevated_assault = city[:aggrevated_assault]
    @aggrevated_assault_rate = city[:aggrevated_assault_rate]
    @property_crime = city[:property_crime]
    @property_crime_rate = city[:property_crime_rate]
    @burglary = city[:burglary]
    @burglary_rate = city[:burglary_rate]
    @larceny_theft = city[:larceny_theft]
    @larceny_theft_rate = city[:larceny_theft_rate]
    @motor_vehicle_theft = city[:motor_vehicle_theft]
    @motor_vehicle_theft_rate = city[:motor_vehicle_theft_rate]
    @state_id = city[:state_id]
  end
end
