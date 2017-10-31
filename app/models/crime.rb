class Crime < ApplicationRecord

  def self.filter(year)
    where("year >= ?", year)
  end

  def self.latest_year
    pluck(:year).min
  end
end
