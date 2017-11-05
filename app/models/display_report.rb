class DisplayReport
  attr_reader :id, :month_year, :avg_weekly_hours,
              :avg_hourly_wages, :avg_weekly_earnings

  def initialize(report)
    @id                  = report[:id]
    @month_year          = report[:month_year]
    @avg_weekly_hours    = report[:avg_weekly_hours]
    @avg_hourly_wages    = report[:avg_hourly_wages]
    @avg_weekly_earnings = report[:avg_weekly_earnings]
    @state_id            = report[:state_id]
  end
end
