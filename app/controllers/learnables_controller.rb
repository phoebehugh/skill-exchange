class LearnablesController < ApplicationController

  autocomplete :skill, :full => true, :limit => 10

  def new
    @learnable = Learnable.new
  end

  def create
    skill = Skill.where(name: params['learnable']['skill']).first_or_create
    Learnable.create(user_id: current_user.id, skill_id: skill.id)
    redirect_to '/'
  end

  def find_matches skill_id
    Shareable.where(skill_id: skill_id)
  end

  helper_method :find_matches

end
