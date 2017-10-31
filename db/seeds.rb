# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'CSV'
require 'Date'

def seed_crimes
  Crime.destroy_all
  CSV.foreach("./db/csvs/FBI-Crime-Data.csv", :headers => true) do |row|
    crime = Crime.new(
      year: row[0].to_i,
      population: sanitize(row["Population1"]).to_i,
      violent_crime: sanitize(row["Violent\rcrime"]).to_i,
      violent_crime_rate: row["Violent \rcrime \rrate "].to_f,
      murder_manslaughter: sanitize(row["Murder and\rnonnegligent \rmanslaughter"]).to_i,
      murder_manslaughter_rate: row["Murder and \rnonnegligent \rmanslaughter \rrate "].to_f,
      rape: sanitize(row["Rape\r(legacy\rdefinition)2"]).to_i,
      rape_rate: row["Rape\r(legacy\rdefinition)2\rrate"].to_i,
      robbery: sanitize(row["Robbery"]).to_i,
      robery_rate: row["Robbery \rrate "].to_f,
      aggrevated_assault: sanitize(row["Aggravated \rassault"]).to_i,
      aggrevated_assault_rate: row["Aggravated \rassault rate "].to_f,
      property_crime: sanitize(row["Property \rcrime"]).to_i,
      property_crime_rate: sanitize(row["Property \rcrime \rrate "]).to_f,
      burglary: sanitize(row["Burglary"]).to_i,
      burglary_rate: sanitize(row["Burglary \rrate "]).to_f,
      larceny_theft: sanitize(row["Larceny-\rtheft"]).to_i,
      larceny_theft_rate: sanitize(row["Larceny-\rtheft rate "]).to_f,
      motor_vehicle_theft: sanitize(row["Motor \rvehicle \rtheft"]).to_i,
      motor_vehicle_theft_rate: row["Motor \rvehicle \rtheft \rrate "].to_f
    )
    crime.save unless Crime.exists?(year: sanitize(row[0]).to_i)
    puts "Crimes recorded for #{crime.year}"
  end
end

def seed_states_with_employment
  AvgWeeklyReport.destroy_all
  State.destroy_all
  CSV.foreach("./db/csvs/Avg-Weekly-Hours.csv", encoding: "bom|utf-8",:headers => true) do |row|
    state = State.create(name: row["State"])
    seed_reports(state)
    puts "Weekly Reports saved for for #{state.name}"
  end
end

def seed_reports(state)
  report   = AvgWeeklyReport.new(state: state)
  report_2 = AvgWeeklyReport.new(state: state)
  report_3 = AvgWeeklyReport.new(state: state)

  CSV.foreach("./db/csvs/Avg-Weekly-Hours.csv", encoding: "bom|utf-8", :headers => true) do |row|
    if row["State"] == state.name
      puts "Weekly Hours saved for for #{state.name}"
      report.month_year = "Sept. 2016"
      report.avg_weekly_hours = row["Sept. 2016"].to_f
      report_2.month_year = "Aug. 2017"
      report_2.avg_weekly_hours = row["Aug. 2017"].to_f
      report_3.avg_weekly_hours = row["Sept. 2017"].to_f
      report_3.month_year = "Sept. 2017"
    end
  end

  CSV.foreach("./db/csvs/Avg-Hourly-Wages.csv", encoding: "bom|utf-8", :headers => true) do |row|
    if row["State"] == state.name
      puts "Hourly Wages saved for for #{state.name}"
      report.avg_hourly_wages = row["Sept. 2016"].to_f
      report_2.avg_hourly_wages = row["Aug. 2017"].to_f
      report_3.avg_hourly_wages = row["Sept. 2017"].to_f
    end
  end

  CSV.foreach("./db/csvs/Avg-Weekly-Earnings.csv", encoding: "bom|utf-8", :headers => true) do |row|
    if row["State"] == state.name
      puts "Weekly Earnings saved for for #{state.name}"
      report.avg_weekly_earnings   = row["Sept. 2016"].to_f
      report_2.avg_weekly_earnings = row["Aug. 2017"].to_f
      report_3.avg_weekly_earnings = row["Sept. 2017"].to_f
    end
  end

  report.save
  report_2.save
  report_3.save
end

def sanitize(row_header)
  if row_header.include?(",")
    row_header.gsub!(",", "")
  end
  return row_header
end

seed_crimes
seed_states_with_employment
