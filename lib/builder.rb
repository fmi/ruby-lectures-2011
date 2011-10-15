class Builder
  attr_accessor :title, :date, :slug

  def initialize(attributes)
    attributes.each do |key, value|
      send "#{key}=", value
    end
  end

  def build
    input        = File.read input_file
    presentation = Presentation.new input, title, date

    open(output_file, 'w') do |file|
      file.write presentation.render
    end
  end

  def input_file
    "src/#@slug.slim"
  end

  def output_file
    "target/#@slug.html"
  end
end
