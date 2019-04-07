module ServicesHelper
  def service_id(service_name, service_id)
    return service_name.gsub(' ', '_').to_s() + '_' + service_id.to_s()
  end
end
