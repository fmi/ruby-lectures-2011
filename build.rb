require 'rubygems'
require 'slim'
require 'yaml'
require 'fileutils'

require './lib/example'
require './lib/slide_helper'
require './lib/presentation'
require './lib/builder'

Slim::Engine.default_options[:disable_escape] = true
Slim::Engine.default_options[:pretty] = true

Slim::EmbeddedEngine.register :example, Example

FileUtils.rm_rf 'target'
FileUtils.mkdir_p 'target'
FileUtils.ln_s 'html/js', 'target/js'
FileUtils.ln_s 'html/css', 'target/css'

YAML.load_file('slides.yaml').values.each do |attributes|
  Builder.new(attributes).build
end
