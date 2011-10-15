require './lib/slides'

FileUtils.rm_rf 'target'
FileUtils.mkdir_p 'target'
FileUtils.ln_s 'html/js', 'target/js'
FileUtils.ln_s 'html/css', 'target/css'

YAML.load_file('slides.yaml').values.each do |attributes|
  Builder.new(attributes).build
end
