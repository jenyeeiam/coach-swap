class CreatePractices < ActiveRecord::Migration[5.0]
  def change
    create_table :practices do |t|
      t.integer :coach_id
      t.date :date
      t.integer :guest_coach_id
      t.string :location

      t.timestamps
    end
  end
end
