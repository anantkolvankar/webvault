json.array!(@levels) do |level|
  json.extract! level, :id, :name, :user_id
  json.url level_url(level, format: :json)
end
