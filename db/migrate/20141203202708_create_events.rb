class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name null: false
      t.text :description null: false
      t.time :time null: false
      t.date :date null: false
      t.string :location null: false
      t.string :host null: false
      t.references :user null: false

      t.timestamps
    end
  end
end
