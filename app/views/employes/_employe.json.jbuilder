json.extract! employe, :id, :motDePasse, :dateEmbauche, :dejaEmbaucher, :estDisponible, :nom, :prenom, :courriel, :role, :organisme_id, :created_at, :updated_at
json.url employe_url(employe, format: :json)
