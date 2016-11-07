class CreatePractices < ActiveRecord::Migration[5.0]
  def change
    create_table :practices do |t|
      t.references :coach, index: true, foreign_key: true
      t.date :date
      t.integer :guest_coach_id
      t.string :location

      t.timestamps
    end
  end
end
