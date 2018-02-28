class Student < ApplicationRecord
	belongs_to :city
	has_many :registrations
	has_many :courses, through: :registrations
	validates_presence_of :name, :email, :major, :dob, :city_id
end
