class Person < ActiveRecord::Base
  NAME_REGEX        = /\A[^[:cntrl:]\\<>\/&]*\z/        # Unicode, permissive
  BAD_NAME_MESSAGE  = "avoid non-printing characters and \\&gt;&lt;&amp;/ please."

  validates_presence_of     :first_name, :with => NAME_REGEX, :message => BAD_NAME_MESSAGE
  validates_presence_of     :last_name, :with => NAME_REGEX,  :message => BAD_NAME_MESSAGE
  validates_numericality_of :age
  validates_presence_of     :dob
  validates_presence_of     :status
  validates_length_of       :city_of_birth, :within => 3..40

end
