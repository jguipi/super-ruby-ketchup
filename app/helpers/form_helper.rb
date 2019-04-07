module FormHelper
  def setup_referent(referent)
    1.times { referent.telephones.build }
    referent
  end

  def setup_organisme(organisme)

  end

  #validates the format and pre-existence of the id
  def validate_id(refid)
    if refid.length < 20
      if !Referent.where("refid = #{refid}").nil?
        return refid
      else
        return false
      end
    else
      return false
    end

  end
end