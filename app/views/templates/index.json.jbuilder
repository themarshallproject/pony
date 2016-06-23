json.array!(@templates) do |template|
  json.extract! template, :id, :title, :header, :footer
  json.url template_url(template, format: :json)
end
