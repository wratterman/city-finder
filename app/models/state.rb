class State < ApplicationRecord
  has_many :avg_weekly_reports
  has_many :cities

  def self.display_reports(state_id)
    InternalService.get_display_reports(state_id).map do |report|
      DisplayReport.new(report)
    end
  end

  def self.display_cities(state_id)
    InternalService.get_display_cities(state_id).map do |city|
      DisplayCity.new(city)
    end
  end
end
