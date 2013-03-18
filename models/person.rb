require './liquid_data'

class Person
  include LiquidData
  liquid_data :name, :position, :webpage
end
