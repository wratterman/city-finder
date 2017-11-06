class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_population

  has_many :avg_weekly_reports
end
