class DisplayCitySerializer < ActiveModel::Serializer
  attributes :id, :name, :population, :violent_crime, :violent_crime_rate,
             :murder_manslaughter, :murder_manslaughter_rate, :rape,
             :rape_rate, :robbery, :robbery_rate, :aggrevated_assault,
             :aggrevated_assault_rate, :property_crime, :property_crime_rate,
             :burglary, :burglary_rate, :larceny_theft, :larceny_theft_rate,
             :motor_vehicle_theft, :motor_vehicle_theft_rate, :state_id, :state

  def state
    id = @object.state_id
    State.find(id).name
  end
end
