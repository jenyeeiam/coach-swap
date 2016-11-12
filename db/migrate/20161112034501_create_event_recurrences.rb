class CreateEventRecurrences < ActiveRecord::Migration[5.0]
  def change
    create_table :event_recurrences do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :every
      t.string :on
      t.integer :coach_id
      t.timestamps
    end
  end
end
