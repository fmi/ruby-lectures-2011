# encoding: utf-8
class Presentation
  PRESENTATION_TEMPLATE = 'slim/presentation.slim'
  MONTHS = %w(януари февруари март април май юни юли август септември октомври ноември декември)

  attr_reader :title, :date, :slug, :slides_html

  def initialize(attributes)
    @title = attributes[:title]
    @date  = attributes[:date]
    @slug  = attributes[:slug]
    @slides_html = generate_html
  end

  def render
    Slim::Template.new(PRESENTATION_TEMPLATE).render(self)
  end

  def date
    "#{@date.day} #{MONTHS[@date.month.succ]} #{@date.year}"
  end

  private

  def generate_html
    Slim::Template.new("src/#{slug}.slim").render(SlideHelper.new)
  end
end
