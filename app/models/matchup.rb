class Matchup < ActiveRecord::Base
  has_one :learnable
  has_one :shareable
  has_one :skill
end
