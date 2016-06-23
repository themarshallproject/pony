json.array!(@emails) do |email|
  json.extract! email, :id, :template_id, :title, :content
  json.url email_url(email, format: :json)
end
