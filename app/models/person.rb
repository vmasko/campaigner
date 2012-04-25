class Person < ActiveRecord::Base

	belongs_to :campaign

	PERSON_ROLES = ["Owner", "Organizer", "Administrator", "Participant"]

	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :name, :maximum => 40
	validates_inclusion_of :role, :in => PERSON_ROLES, :allow_blank => true

end
