json.array!(@secchis) do |secchi|
  json.extract! secchi, :id, :sample_time, :secchi_depth_ft, :weather, :comments, :lake_id
  json.url secchi_url(secchi, format: :json)
end
