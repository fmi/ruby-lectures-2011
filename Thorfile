require './lib/slides'

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
      @slides ||= YAML.load_file 'lectures/index.yml'
    end
  end
end
