class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :team
      t.string :age_group
      t.string :state
      # t.string :email
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
