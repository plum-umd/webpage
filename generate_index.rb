require 'json'
require 'liquid'

require './person'
require './project'

# Tells us where things are.
class Templates
  CONF = Dir.pwd + '/config/'
  INDEX = 'index.template'
  PEOPLE = CONF + 'people.json'
  PROJECTS = CONF + 'projects.json'
end

# Generate the index page
class IndexGenerator
  attr_accessor :people
  
  def initialize
    @template = Liquid::Template.parse(File.read(Templates::INDEX))
    @people = get_people
    @projects = {'projects'=>get_projects}
  end
  
  def get_projects
    projects = []
    JSON.parse(File.read(Templates::PROJECTS)).each do |x|
      projects << Project.new(x)
    end
  end
  
  # Reads in the list of people and parses it
  def get_people
    people = []
    JSON.parse(File.read(Templates::PEOPLE)).each do |x|
      people << Person.new(x)
    end
    people = people.group_by { |x| x.position }
    ret = {}
    people.each_key { |k|
      ret[k] = people[k].sort_by { |x| (x.name.split('(')[0].strip.split[-1]) } # Requires last name
    }
    ret
  end
  
  # Actually render and write the page
  def write_page
    puts @people["faculty"]
    puts "--"
    puts [@people,@projects].inject({}) { |x,y| x.merge(y) }
    File.open('index.html','w') do |f|
      f.write(@template.render([@people,@projects].inject({}) { |x,y| x.merge(y) }))
    end
  end
  
end

IndexGenerator.new.write_page

