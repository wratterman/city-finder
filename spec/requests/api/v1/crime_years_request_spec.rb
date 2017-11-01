require 'rails_helper'

describe "Crime Years API" do
  context "It returns the crimes for every year since" do
    it "Default (1994)" do
      crime_list = create_list(:crime, 3)

      get '/api/v1/crime_years'

      expect(response).to be_success
      expect(response.status).to eq(200)

      crimes = JSON.parse(body)

      expect(crimes.count).to eq(crime_list.count)

      expect(crimes.first["id"]).to eq(crime_list.first.id)
      expect(crimes.first["id"]).to_not eq(crime_list[1].id)
      expect(crimes.first["id"]).to_not eq(crime_list.last.id)

      expect(crimes.last["id"]).to_not eq(crime_list.first.id)
      expect(crimes.last["id"]).to_not eq(crime_list[1].id)
      expect(crimes.last["id"]).to eq(crime_list.last.id)
    end

    it "wont return reports from years older than search params" do
      crime_list = create_list(:crime, 3)
      search_year = (crime_list.pluck(:year).min) + 1

      get "/api/v1/crime_years?year=#{search_year}"

      expect(response).to be_success
      expect(response.status).to eq(200)

      crimes = JSON.parse(body)
      expect(crimes.count).to eq(2)
      expect(crime_list.count).to eq(3)
      expect(crimes.first["year"]).to eq(search_year)
      expect(crimes.last["year"]).to eq(search_year + 1)
    end

    it "wont return reports from years older than search params x2" do
      crime_list = create_list(:crime, 3)
      search_year = (crime_list.pluck(:year).max)

      get "/api/v1/crime_years?year=#{search_year}"

      expect(response).to be_success
      expect(response.status).to eq(200)

      crimes = JSON.parse(body)
      expect(crimes.count).to eq(1)
      expect(crime_list.count).to eq(3)
      expect(crimes.first["year"]).to eq(search_year)
    end
  end
end
