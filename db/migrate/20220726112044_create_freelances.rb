class CreateFreelances < ActiveRecord::Migration[7.0]
  def change
    create_table :freelances do |t|

      t.text :bio
      t.integer :rate
      t.boolean :feature
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
