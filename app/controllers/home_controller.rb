class HomeController < ApplicationController
  def index
  end
  
  def find_matching_shareables skill_id
    Shareable.where(skill_id: skill_id)
  end

  def find_matching_learnables skill_id
    Learnable.where(skill_id: skill_id)
  end

  helper_method :find_matching_shareables
  helper_method :find_matching_learnables

end
