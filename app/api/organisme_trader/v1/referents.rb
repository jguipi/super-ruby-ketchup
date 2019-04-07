module OrganismeTrader
  module V1
    class Referents < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :referents do

        desc 'get all referents'
        get do
          if !:query.nil?
            q = "%#{params[:query]}%";
            @queryParam = params[:query];
            #find referents that have fields fuzzilly matching the query
            #works for all the fields inside the referents. doesn't work with telephone or organisme since those aren't field
            #in Referents
            @referents =  Referent.where("LOWER(prenom) LIKE ? OR LOWER(nom) LIKE ? OR LOWER(courriel) LIKE ? OR LOWER(fax) LIKE ? OR LOWER(title) LIKE ? OR LOWER(departement) LIKE ? OR refid LIKE ?",q.downcase,q.downcase,q.downcase,q.downcase,q.downcase,q.downcase,q)

            @referents.as_json(include: [:telephones])
          else
            Referent.all
          end
        end


      end
    end
  end
end