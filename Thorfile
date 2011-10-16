require './lib/slides'
require 'guard'

class Thor::Actions::CreateFile
  def force_on_collision?
    true
  end
end

class Default < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  desc 'rebuild', 'Rebuilds all presentations'
  def rebuild
    empty_directory 'compiled'
    directory 'html/js', 'compiled/js'
    directory 'html/css', 'compiled/css'
    copy_file 'lectures/index.yml', 'compiled/index.yml'

    slides.keys.each do |number|
      lecture number
    end
  end

  desc 'watch', 'Fires up guard to rebuld presentations on demand'
  def watch
    listener = Guard::Listener.select_and_init
    listener.on_change do |files|
      files.grep(/lectures\/(\d+)-/) { lecture $1.to_i }
    end
    listener.start
  end

  desc 'lecture', 'Rebuilds a single lecture'
  def lecture(index)
    builder = builder_for(index)

    create_file "compiled/#{builder.output_filename}", builder.html.force_encoding('BINARY')
  end

  no_tasks do
    def builder_for(index)
      Builder.new slides[index.to_i]
    end

    def slides
      return @slides if @slides

      @slides = YAML.load_file 'lectures/index.yml'
      @slides.delete_if { |index, attributes| attributes.has_key? 'url' }

      @slides
    end
  end
end
