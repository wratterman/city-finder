class StateSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :avg_weekly_reports
end
