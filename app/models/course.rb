class Course < ApplicationRecord
	has_many :registrations
	has_many :students, through: :registrations
	belongs_to :instructor
	validates_presence_of :name, :description, :instructor_id

	def self.show_chart 
		@courses = Course.all 
		@data = {}
		@courses.each do |course|
			@data[course.name] = course.students.length
		end
		return @data
	end
end
