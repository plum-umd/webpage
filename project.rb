class Project
  attr_reader :name, :description, :webpage, :long_desc
  
  def initialize(map)
    @name = map["name"]
    @description = map["description"]
    @webpage = map["webpage"]
    if map["long_desc"] then 
      @long_desc = p File.read(map["long_desc"]) 
    end
  end
  
  def to_liquid
    acc = instance_variables.inject({}) do |x,y|
      x.merge(if instance_variable_get(y) then {y=>instance_variable_get(y)} else {} end)
    end
    acc
  end
  
end
