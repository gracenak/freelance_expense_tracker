class CreateGigsTable < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :employer
      t.string :description
      t.date :date
      t.decimal :payment
      t.decimal :expenses
      t.integer :user_id
    end
  end
end
