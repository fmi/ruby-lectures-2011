class Builder
  attr_accessor :title, :date, :slug

  def initialize(attributes)
    attributes.each do |key, value|
      send "#{key}=", value
    end
  end

  def html
    input        = File.read source_file
    presentation = Presentation.new input, title, date

    presentation.render
  end

  def output_filename
    "#@slug.html"
  end

  private

  def source_file
    "src/#@slug.slim"
  end
end
