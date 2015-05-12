class LearnablesController < ApplicationController

  autocomplete :skill, :full => true, :limit => 10

  def new
    @learnable = Learnable.new
  end

  def create
    skill = Skill.where(name: params['learnable']['skill']).first_or_create
    Learnable.create(user_id: current_user.id, skill_id: skill.id)
    check_for_matches_and_build_matchup skill.id
    redirect_to '/'
  end

  def check_for_matches_and_build_matchup skill_id
    return nil if Matchup.exists?(skill_id: skill_id, learner_id: current_user.id)
    shareable_found = Shareable.where(skill_id: skill_id).first
    if shareable_found
      Matchup.create(skill_id: skill_id, sharer_id: shareable_found.user_id, learner_id: current_user.id)
    end
  end

end
