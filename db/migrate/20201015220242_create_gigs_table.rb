class CreateGigsTable < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :employer
      t.date :date
      t.string :description
      t.decimal :payment
      t.decimal :expenses
      t.integer :user_id
    end
  end
end
