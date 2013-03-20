require_relative '../liquid_data'

class Event
  include LiquidData
  liquid_data :name, :url, :description
end
