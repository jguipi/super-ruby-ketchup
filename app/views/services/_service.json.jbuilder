json.extract! service, :id, :nom, :description, :tarification, :estSubventionner, :tarificationCISSS, :created_at, :updated_at
json.url service_url(service, format: :json)