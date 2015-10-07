class CreateAngels < ActiveRecord::Migration
  def change
    create_table :angels do |t|
      t.string :name
      t.string :bio
      t.string :email
      t.string :img

      t.timestamps null: false
    end
  end
end
