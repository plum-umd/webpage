require './liquid_data'

class Project
  include LiquidData
  attr_reader :name, :description, :webpage, :status, :long_desc
  
  def initialize(map)
    @name = map["name"]
    @description = map["description"]
    @webpage = map["webpage"]
    @status = map["status"]
    @long_desc = File.read(map["long_desc"]) if map["long_desc"]
  end
  
end
