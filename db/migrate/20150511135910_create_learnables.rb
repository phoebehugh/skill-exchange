class CreateLearnables < ActiveRecord::Migration
  def change
    create_table :learnables do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
