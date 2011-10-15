# encoding: utf-8
class Presentation
  PRESENTATION_TEMPLATE = 'slim/lecture.slim'
  MONTHS = %w(януари февруари март април май юни юли август септември октомври ноември декември)

  attr_reader :title, :date, :slug, :slides_html

  def initialize(input, title, date)
    @title = title
    @date  = date
    @slides_html = generate_html input
  end

  def render
    Slim::Template.new(PRESENTATION_TEMPLATE).render(self)
  end

  def date
    "#{@date.day} #{MONTHS[@date.month.succ]} #{@date.year}"
  end

  private

  def generate_html(input)
    Slim::Template.new { input }.render(SlideHelper.new)
  end
end
