require './liquid_data'

class Person
  include LiquidData
  attr_reader :name, :position, :webpage
  
  def initialize(map)
    @name = map["name"]
    @position = map["position"]
    @webpage = map["webpage"]
  end
  
end
