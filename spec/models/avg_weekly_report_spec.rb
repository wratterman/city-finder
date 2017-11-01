require 'rails_helper'

RSpec.describe AvgWeeklyReport, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:state) }
  end
end
