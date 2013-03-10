require 'bundler/setup'
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
  def initialize
    @template = Liquid::Template.parse(File.read(Templates::INDEX))
  end
  
  def projects
    file_contents = File.read(Templates::PROJECTS)
    entries = JSON.parse(file_contents).map { |x| Project.new(x) }
    entries.group_by { |x| x.status }
  end
  
  # Reads in the list of people and parses it
  def people
    file_contents = File.read(Templates::PEOPLE)
    entries = JSON.parse(file_contents).map { |x| Person.new(x) }
    sorted = entries.sort_by { |x| (x.name.split('(')[0].strip.split[-1]) }
    sorted.group_by { |x| x.position }
  end
  
  # Actually render and write the page
  def write_page
    contents = [people,projects].inject({}) { |x,y| x.merge(y) }
    File.open('index.html','w') do |f|
      f.write(@template.render(contents))
    end
  end
  
end

IndexGenerator.new.write_page

