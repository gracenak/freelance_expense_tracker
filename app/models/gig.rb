class Gig < ActiveRecord::Base
    belongs_to :user
    validates :employer, :date, :description, :payment, :expenses, presence: true
    validates :payment, :expenses, numericality: {greater_than_or_equal_to: 0}
end