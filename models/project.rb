require_relative '../liquid_data'

class Project
  include LiquidData
  liquid_data :name, :description, :webpage, :status
  liquid_data :long_desc do |s| File.read(s) end
end
