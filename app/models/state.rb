class State < ApplicationRecord
  has_many :avg_weekly_reports
  has_many :cities
end
