class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :obtained , default: 0
      t.integer :track , default: 0
      t.timestamps
    end
  end
end
