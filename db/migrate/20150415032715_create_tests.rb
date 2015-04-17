class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :problem
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.string :answer
      t.string :score
      t.references :video, index: true

      t.timestamps null: false
    end
    add_foreign_key :tests, :videos
  end
end
