class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.string :sharer
      t.string :learner
      t.string :skill

      t.timestamps null: false
    end
  end
end
