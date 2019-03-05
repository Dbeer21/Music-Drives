json.extract! instrument, :id, :name, :location, :donor, :created_at, :updated_at
json.url instrument_url(instrument, format: :json)
