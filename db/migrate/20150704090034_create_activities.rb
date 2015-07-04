class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :topic
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
