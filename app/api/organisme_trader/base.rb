module OrganismeTrader
  class Base < Grape::API
    mount OrganismeTrader::V1::Organismes
    mount OrganismeTrader::V1::Referents
  end
end