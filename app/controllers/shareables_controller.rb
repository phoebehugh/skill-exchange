class ShareablesController < ApplicationController

  autocomplete :skill, :full => true, :limit => 10

  def new
    @shareable = Shareable.new
  end

  def create
    skill = Skill.where(name: params['shareable']['skill']).first_or_create
    Shareable.create(user_id: current_user.id, skill_id: skill.id)
    check_for_matches_and_build_matchup skill.id
    redirect_to '/'
  end

  def check_for_matches_and_build_matchup skill_id
    return nil if Matchup.exists?(skill_id: skill_id, sharer_id: current_user.id)
    learnable_found = Learnable.where(skill_id: skill_id).first
    if learnable_found
      Matchup.create(skill_id: skill_id, sharer_id: current_user.id, learner_id: learnable_found.user_id)
    end
  end

end
