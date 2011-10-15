class Example < Slim::Filter
  def on_slim_embedded(engine, body)
    code = Slim::CollectText.new.call(body)
    html = "<pre>#{code}</pre>"
    [:static, html]
  end
end
