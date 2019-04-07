module EmployeTrader
  module V1
    class Employes < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :employes do
        desc "Return list of employes"
        get do
          @employes = Employe.all
          @employes.as_json()
        end

        desc "Create an employe"
        post do
          @employe = Employe.new(params)
          params[:departements] ||= []
          @employe.save
        end

        desc "Return an employe"
        params do
          requires :id, type: Integer, desc: "Employe id"
        end
        route_param :id do
          get do
            Employe.find(params[:id]).as_json()
          end
        end
      end
    end
  end
end
