class Registration < ApplicationRecord
	belongs_to :course
	belongs_to :student
	#validates_presence_of :student_id, :course_id
end
