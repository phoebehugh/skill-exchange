class SkillsController < ApplicationController

  autocomplete :skill, :name, :full => true, :limit => 10

end
