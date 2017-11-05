class InternalService

  def initialize(state_id)
    @state_id = state_id
    @base = "https://spooky-werewolf-89206.herokuapp.com/api/v1/"
  end

  def self.get_display_reports(state_id)
    new(state_id).display_reports
  end

  def self.get_display_cities(state_id)
    new(state_id).display_cities
  end

  def display_cities
    get_url("#{@state_id}/display_cities?limit=10")
  end

  def display_reports
    get_url("#{@state_id}/display_reports")
  end

  private

  attr_reader :base

  def get_url(url)
    response = Faraday.get(base + url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
