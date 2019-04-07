json.extract! adress, :id, :rue, :string, :ville, :string, :pays, :string, :codePostal, :created_at, :updated_at
json.url adress_url(adress, format: :json)