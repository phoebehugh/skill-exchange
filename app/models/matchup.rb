class Matchup < ActiveRecord::Base
  has_many :learnables
  has_many :shareables
end
