module PointServicesHelper
  def check_if_ptservice_contains_departement(ptService, departement_id)
    logger.debug "Organisme id :" + ptService.id.to_s()
    if ptService.id.blank?
      logger.debug "ID IS BLANK!"
      return ""
    end
    if ptService.nom.blank?
      logger.debug "NAME IS BLANK!"
      return ""
    end
    logger.debug "Departement ID to look for : " + departement_id.to_s()
    logger.debug "Current organisme :" + ptService.nom.to_s()
    if PointServiceDepartement.where(:point_service_id => ptService.id, :departement_id => departement_id).present?
      return "checked"
    end
    return ""
  end

  def set_point_service_adresse(point_service)
    if point_service.adresse.nil?
      logger.debug "Current Adresse is nil! :D"
      point_service.adresse = Adresse.new
    end
    if point_service.adresse.id.nil?
      logger.debug "Current Adresse is nil! :D"
      point_service.adresse = Adresse.new
    end
    logger.debug "Current Adresse is not nil! :O"
    return point_service.adresse
  end
end
