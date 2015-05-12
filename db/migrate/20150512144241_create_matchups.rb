class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.integer :skill_id
      t.integer :sharer_id
      t.integer :learner_id

      t.timestamps null: false
    end
  end
end
