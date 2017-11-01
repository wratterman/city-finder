require 'rails_helper'

RSpec.describe State, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:cities) }
    it { is_expected.to have_many(:avg_weekly_reports) }
  end
end
