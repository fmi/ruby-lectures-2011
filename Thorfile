require './lib/slides'

class Default < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  desc 'rebuild', 'Rebuilds all presentations'
  def rebuild
    empty_directory 'target'
    directory 'html/js', 'target/js'
    directory 'html/css', 'target/css'

    slides.keys.each do |number|
      lecture number
    end
  end

  desc 'lecture', 'Rebuilds a single lecture'
  def lecture(index)
    builder = builder_for(index)

    create_file "target/#{builder.output_filename}", builder.html.force_encoding('BINARY')
  end

  no_tasks do
    def builder_for(index)
      Builder.new slides[index.to_i]
    end

    def slides
      @slides ||= YAML.load_file 'slides.yaml'
    end
  end
end
