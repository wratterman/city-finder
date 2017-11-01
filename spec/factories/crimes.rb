FactoryGirl.define do
  factory :crime do
    sequence :year do |i|
        1994 + "#{i}".to_i
    end
    population 10000
    violent_crime 38
    violent_crime_rate (38.0/10000.0) * 100000.0
    murder_manslaughter 12
    murder_manslaughter_rate (12.0/10000.0) * 100000.0
    rape 6
    rape_rate (6.0/10000.0) * 100000.0
    robbery 13
    robery_rate (13.0/10000.0) * 100000.0
    aggrevated_assault 7
    aggrevated_assault_rate (7.0/10000.0) * 100000.0
    property_crime 18
    property_crime_rate (18.0/10000.0) * 100000.0
    burglary 3
    burglary_rate (3.0/10000.0) * 100000.0
    larceny_theft 9
    larceny_theft_rate (9.0/10000.0) * 100000.0
    motor_vehicle_theft 23
    motor_vehicle_theft_rate (23.0/10000.0) * 100000.0
  end
end
