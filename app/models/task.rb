class Task < ActiveRecord::Base
	belongs_to :user
	validates :description, :end_date, presence: true
end
