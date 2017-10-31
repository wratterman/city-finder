class CreateCrimes < ActiveRecord::Migration[5.1]
  def change
    create_table :crimes do |t|
      t.integer :year
      t.integer :population
      t.integer :violent_crime
      t.float :violent_crime_rate
      t.integer :murder_manslaughter
      t.float :murder_manslaughter_rate
      t.integer :rape
      t.float :rape_rate
      t.integer :robbery
      t.float :robery_rate
      t.integer :aggrevated_assault
      t.float :aggrevated_assault_rate
      t.integer :property_crime
      t.float :property_crime_rate
      t.integer :burglary
      t.float :burglary_rate
      t.integer :larceny_theft
      t.float :larceny_theft_rate
      t.integer :motor_vehicle_theft
      t.float :motor_vehicle_theft_rate

      t.timestamps
    end
  end
end
