class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :address
      t.string :address
      t.string :name
      t.text :description
      t.time :time
      t.date :date
      t.string :location
      t.string :host
      t.references :user, index: true

      t.timestamps
    end
  end
end
