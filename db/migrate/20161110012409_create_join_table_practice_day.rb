class CreateJoinTablePracticeDay < ActiveRecord::Migration[5.0]
  def change
    create_join_table :practices, :days do |t|
      t.index [:practice_id, :day_id]
      t.index [:day_id, :practice_id]
    end
  end
end
