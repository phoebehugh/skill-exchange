class HomeController < ApplicationController
  def index
  end
  
  def find_matches skill_id
    Shareable.where(skill_id: skill_id)
  end

  helper_method :find_matches

end
