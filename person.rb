class Person
  attr_reader :name, :position, :webpage
  
  def initialize(map)
    @name = map["name"]
    @position = map["position"]
    @webpage = map["webpage"]
  end
  
  def to_liquid
    acc = instance_variables.inject({}) do |x,y|
      x.merge(if instance_variable_get(y) then {y.to_s.gsub(/@/,'')=>instance_variable_get(y)} else {} end)
    end
    acc
  end
  
end
