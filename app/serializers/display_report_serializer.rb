class DisplayReportSerializer < ActiveModel::Serializer
  attributes :id, :avg_weekly_hours, :avg_hourly_wages, :avg_weekly_earnings,
             :month_year, :state_id, :state

  def state
    id = @object.state_id
    State.find(id).name
  end
end
