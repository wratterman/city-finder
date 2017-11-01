class City < ApplicationRecord
  belongs_to :state

  def self.most_dangerous_cities(crime)
    if crime.downcase == "violent_crime"
      City.where("violent_crime_rate != ? AND population > ?", 'NaN', 10000).order(violent_crime_rate: :DESC).limit(10)
    elsif crime.downcase == "murder" || crime.downcase == "manslaughter"
      City.where("murder_manslaughter_rate != ? AND population > ?", 'NaN', 10000).order(murder_manslaughter_rate: :DESC).limit(10)
    elsif crime.downcase == "rape"
      City.where("rape_rate != ? AND population > ?", 'NaN', 10000).order(rape_rate: :DESC).limit(10)
    elsif crime.downcase == "robbery"
      City.where("robbery_rate != ? AND population > ?", 'NaN', 10000).order(robbery_rate: :DESC).limit(10)
    elsif crime.downcase == "aggrevated_assault"
      City.where("aggrevated_assault_rate != ? AND population > ?", 'NaN', 10000).order(aggrevated_assault_rate: :DESC).limit(10)
    elsif crime.downcase == "property_crime"
      City.where("property_crime_rate != ? AND population > ?", 'NaN', 10000).order(property_crime_rate: :DESC).limit(10)
    elsif crime.downcase == "burglary"
      City.where("burglary_rate != ? AND population > ?", 'NaN', 10000).order(burglary_rate: :DESC).limit(10)
    elsif crime.downcase == "larceny_theft"
      City.where("larceny_theft_rate != ? AND population > ?", 'NaN', 10000).order(larceny_theft_rate: :DESC).limit(10)
    elsif crime.downcase == "motor_vehicle_theft"
      City.where("motor_vehicle_theft_rate != ? AND population > ?", 'NaN', 10000).order(motor_vehicle_theft_rate: :DESC).limit(10)
    end
  end
end
