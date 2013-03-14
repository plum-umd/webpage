require './liquid_data'

class Event
  include LiquidData
  attr_reader :name, :url, :description

  def initialize(map)
    @name = map["name"]
    @url = map["url"]
    @description = map["description"]
  end

end
