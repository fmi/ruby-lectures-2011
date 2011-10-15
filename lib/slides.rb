require 'rubygems'
require 'slim'
require 'yaml'
require 'fileutils'

$:.unshift File.dirname(__FILE__) + '/slides'

autoload :Example,     'example'
autoload :SlideHelper, 'slide_helper'
autoload :Lecture,     'lecture'
autoload :Builder,     'builder'

Slim::Engine.default_options[:disable_escape] = true
Slim::Engine.default_options[:pretty] = true

Slim::EmbeddedEngine.register :example, Example
