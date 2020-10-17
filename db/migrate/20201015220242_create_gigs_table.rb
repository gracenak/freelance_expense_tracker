class CreateGigsTable < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :employer
      t.date :date
      t.string :description
      t.decimal :payment, precision: 10, scale: 2
      t.decimal :expenses
      t.integer :user_id
    end
  end
end
