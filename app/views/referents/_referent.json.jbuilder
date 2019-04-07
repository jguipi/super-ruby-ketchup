json.extract! referent, :id, :nom, :prenom, :fax, :courriel, :created_at, :updated_at
json.url referent_url(referent, format: :json)