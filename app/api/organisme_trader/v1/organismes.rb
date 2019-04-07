module OrganismeTrader
  module V1
    class Organismes < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api


      resource :organismes do
        desc "Return list of organismes"
        get do
          @organismes = Organisme.all
          @organismes.as_json(include:[:employes, :point_service, :departements])
        end

        desc "Create an organisme"
        post do
          @organisme = Organisme.new(params)
          params[:departements] ||= []
          @organisme.save
        end

        desc "Return an organisme"
        params do
          requires :id, type: Integer, desc: "Organisme id"
        end
        route_param :id do
          get do
            Organisme.find(params[:id]).as_json(include:[:employes, :point_service])
          end
        end

      end
      resource 'organismes/locals' do
        desc "Return all associated locals that are associated with organismes"
        params do
          requires :id, type: Integer, desc: "Organisme id"
        end
        route_param :id do
          get do
            allPointServices = PointService.where(organisme_id: params[:id])
            ids_array = allPointServices.ids
            Local.where(point_service_id: ids_array)
          end
        end
      end


      resource 'organismes/employes' do
        desc "Return an organisme associated with employe"
        params do
          requires :id, type: Integer, desc: "Employe id"
        end
        route_param :id do
          get do
            employe = Employe.find(params[:id])
            employe.organisme.as_json(include:[:employes, :point_service, :departements])
          end
        end
      end

      resource 'organismes/departements' do
        desc "Return all departements associated with organisme"
        params do
          requires :id, type: Integer, desc: "Organisme id"
        end
        route_param :id do
          get do
            Organisme.find(params[:id]).departements
          end
        end
      end

      resource 'departements/all' do
        desc "Return all departements"
          get do
            Departement.all
        end
      end
    end
  end
end
