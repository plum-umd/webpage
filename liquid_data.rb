module LiquidData
  def to_liquid
    instance_variables.inject({}) do |x,y|
      x.merge({y.to_s.gsub(/@/,'')=>instance_variable_get(y)})
    end
  end  
end
