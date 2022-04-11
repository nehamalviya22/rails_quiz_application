class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
