eval File.read("#{File.dirname(__FILE__)}/Thorfile")

thor_instance = Default.new

guard 'shell' do
  watch(%r{lectures/(\d+).*\.slim}) { |match| thor_instance.lecture match[1].to_i }
end
