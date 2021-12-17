class CreateBusinessCards < ActiveRecord::Migration[6.1]
  def change
    create_table :business_cards do |t|
      t.string :name
      t.string :email
      t.string :web_site
      t.string :phone_number
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
