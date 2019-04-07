module EmployeTrader
  class Base < Grape::API
    mount EmployeTrader::V1::Employes
  end
end
