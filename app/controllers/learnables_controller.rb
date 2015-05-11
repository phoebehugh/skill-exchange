class LearnablesController < ApplicationController
  def new
    @learnable = Learnable.new
  end

  def create
    skill = Skill.where(name: params['learnable']['skill']).first_or_create
    Learnable.create(user_id: current_user.id, skill_id: skill.id)
    redirect_to '/'
  end

end
