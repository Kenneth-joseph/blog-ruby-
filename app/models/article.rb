class Article < ApplicationRecord
    #to include the model concern that has the status logic we will include the visibility moodule here.
    include Visibility
    # update the realtionship between article and the comment model 
    has_many :comments
    #from the forms fields, to ensure the data coming through is validated and the fields are filled s required we validate the fields from the models here
    validates :title, presence: true
    validates :author, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 20}
   
end
