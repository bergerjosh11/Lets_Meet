class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :user, index: true
      t.belongs_to :shout, index: true

      t.timestamps
    end
  end
end
