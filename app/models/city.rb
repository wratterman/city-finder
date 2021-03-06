class City < ApplicationRecord
  belongs_to :state

  def self.most_dangerous_cities(crime, limit=20)
    case crime.downcase
    when "violent_crime"
      City.where("violent_crime_rate != ? AND population > ?", 'NaN', 100000).order(violent_crime_rate: :DESC).limit(limit)
    when "murder", "manslaughter"
      City.where("murder_manslaughter_rate != ? AND population > ?", 'NaN', 100000).order(murder_manslaughter_rate: :DESC).limit(limit)
    when "rape"
      City.where("rape_rate != ? AND population > ?", 'NaN', 100000).order(rape_rate: :DESC).limit(limit)
    when "robbery"
      City.where("robbery_rate != ? AND population > ?", 'NaN', 100000).order(robbery_rate: :DESC).limit(limit)
    when "aggrevated_assault"
      City.where("aggrevated_assault_rate != ? AND population > ?", 'NaN', 100000).order(aggrevated_assault_rate: :DESC).limit(limit)
    when "property_crime"
      City.where("property_crime_rate != ? AND population > ?", 'NaN', 100000).order(property_crime_rate: :DESC).limit(limit)
    when "burglary"
      City.where("burglary_rate != ? AND population > ?", 'NaN', 100000).order(burglary_rate: :DESC).limit(limit)
    when "larceny_theft"
      City.where("larceny_theft_rate != ? AND population > ?", 'NaN', 100000).order(larceny_theft_rate: :DESC).limit(limit)
    when "motor_vehicle_theft"
      City.where("motor_vehicle_theft_rate != ? AND population > ?", 'NaN', 100000).order(motor_vehicle_theft_rate: :DESC).limit(limit)
    end
  end

  def self.safest_cities(crime, limit=20)
    case crime.downcase
    when "violent_crime"
      City.where("population > ?", 100000).order(violent_crime_rate: :ASC).limit(limit)
    when "murder", "manslaughter"
      City.where("population > ?", 100000).order(murder_manslaughter_rate: :ASC).limit(limit)
    when "rape"
      City.where("population > ?", 100000).order(rape_rate: :ASC).limit(limit)
    when "robbery"
      City.where("population > ?", 100000).order(robbery_rate: :ASC).limit(limit)
    when "aggrevated_assault"
      City.where("population > ?", 100000).order(aggrevated_assault_rate: :ASC).limit(limit)
    when "property_crime"
      City.where("population > ?", 100000).order(property_crime_rate: :ASC).limit(limit)
    when "burglary"
      City.where("population > ?", 100000).order(burglary_rate: :ASC).limit(limit)
    when "larceny_theft"
      City.where("population > ?", 100000).order(larceny_theft_rate: :ASC).limit(limit)
    when "motor_vehicle_theft"
      City.where("population > ?", 100000).order(motor_vehicle_theft_rate: :ASC).limit(limit)
    end
  end

  def self.most_dangerous_cities_for(crime, state_id, limit=20)
    case crime.downcase
    when "violent_crime"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(violent_crime_rate: :DESC).limit(limit)
    when "murder" || "manslaughter"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(murder_manslaughter_rate: :DESC).limit(limit)
    when "rape"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(rape_rate: :DESC).limit(limit)
    when "robbery"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(robbery_rate: :DESC).limit(limit)
    when "aggrevated_assault"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(aggrevated_assault_rate: :DESC).limit(limit)
    when "property_crime"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(property_crime_rate: :DESC).limit(limit)
    when "burglary"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(burglary_rate: :DESC).limit(limit)
    when "larceny_theft"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(larceny_theft_rate: :DESC).limit(limit)
    when "motor_vehicle_theft"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(motor_vehicle_theft_rate: :DESC).limit(limit)
    end
  end

  def self.safest_cities_for(crime, state_id, limit=20)
    case crime.downcase
    when "violent_crime"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(violent_crime_rate: :ASC).limit(limit)
    when "murder" || "manslaughter"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(murder_manslaughter_rate: :ASC).limit(limit)
    when "rape"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(rape_rate: :ASC).limit(limit)
    when "robbery"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(robbery_rate: :ASC).limit(limit)
    when "aggrevated_assault"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(aggrevated_assault_rate: :ASC).limit(limit)
    when "property_crime"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(property_crime_rate: :ASC).limit(limit)
    when "burglary"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(burglary_rate: :ASC).limit(limit)
    when "larceny_theft"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(larceny_theft_rate: :ASC).limit(limit)
    when "motor_vehicle_theft"
      City.where("population > ? AND state_id = ?", 10000, state_id).order(motor_vehicle_theft_rate: :ASC).limit(limit)
    end
  end

  def self.for_display(state_id, limit)
    City.where(state_id: state_id).order(population: :DESC).limit(limit)
  end
end
