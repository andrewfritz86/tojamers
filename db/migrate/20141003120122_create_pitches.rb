class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|

      t.timestamps
    end
  end
end
