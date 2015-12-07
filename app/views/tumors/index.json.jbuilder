json.array!(@tumors) do |tumor|
  json.extract! tumor, :id, :edad, :genero, :tipo_histologico, :grado_tumor, :hueso, :medula_osea, :pulmon, :pleura, :peritoneum, :higado, :cerebro, :piel, :cuello, :supraclavicular, :axilar, :mediastino, :abdominal, :tipo_tumor
  json.url tumor_url(tumor, format: :json)
end
