class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string :sport
    	t.datetime :start_time

      t.timestamps
    end
  end
end
