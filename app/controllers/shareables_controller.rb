class ShareablesController < ApplicationController

  autocomplete :skill, :full => true, :limit => 10

  def new
    @shareable = Shareable.new
  end

  def create
    skill = Skill.where(name: params['shareable']['skill']).first_or_create
    Shareable.create(user_id: current_user.id, skill_id: skill.id)
    redirect_to '/'
  end

end
