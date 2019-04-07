module OrganismesHelper
  def departement_id(departement_description, departement_id)
    return departement_description.gsub(' ', '_').to_s() + '_' + departement_id.to_s()
  end

  def check_if_contains_departement(organisme, departement_id)
    logger.debug "Organisme id :" + organisme.id.to_s()
    if organisme.id.blank?
      logger.debug "ID IS BLANK!"
      return ""
    end
    if organisme.name.blank?
      logger.debug "NAME IS BLANK!"
      return ""
    end
    logger.debug "Departement ID to look for : " + departement_id.to_s()
    logger.debug "Current organisme :" + organisme.name.to_s()
    if OrganismeDepartement.where(:organisme_id => organisme.id, :departement_id => departement_id).present?
      return "checked"
    end
    return ""
  end
end
