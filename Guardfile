guard 'shell' do
  watch(%r{lectures/(\d+).*\.slim}) { |m| `yes | thor lecture #{m[1].to_i}` }
end
