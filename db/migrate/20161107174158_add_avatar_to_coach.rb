class AddAvatarToCoach < ActiveRecord::Migration[5.0]
  def change
    add_column :coaches, :avatar, :string
  end
end
