class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.belongs_to :user, index: true
      t.string :token

      t.timestamps null: false
    end
  end
end
