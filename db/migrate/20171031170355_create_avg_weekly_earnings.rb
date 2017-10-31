class CreateAvgWeeklyEarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :avg_weekly_reports do |t|
      t.string :month_year
      t.float :avg_weekly_hours
      t.float :avg_hourly_wages
      t.float :avg_weekly_earnings
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
