json.array!(@works) do |work|
  json.extract! work, :id, :title, :min_year, :max_year, :circa, :place, :decimal, :decimal
  json.url work_url(work, format: :json)
end
