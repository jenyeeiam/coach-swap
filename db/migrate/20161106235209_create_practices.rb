class CreatePractices < ActiveRecord::Migration[5.0]
  def change
    create_table :practices do |t|
      t.references :coach, index: true, foreign_key: true
      t.string :day_of_week
      t.string :time
      t.string :duration
      t.integer :guest_coach_id
      t.string :location
      t.datetime :date
      t.string :team_name
      t.string :age_group
      t.string :state

      t.timestamps
    end
  end
end
