json.extract! point_service, :id, :nom, :courriel, :fax, :siteWeb, :string, :created_at, :updated_at
json.url point_service_url(point_service, format: :json)