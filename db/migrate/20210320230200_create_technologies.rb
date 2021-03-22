class CreateTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :title, null: false
      t.integer :level, null: false

      t.timestamps
    end
  end
end
