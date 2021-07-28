class Article < ApplicationRecord
    #from the forms fields, to ensure the data coming through is validated and the fields are filled s required we validate the fields from the models here
    # update the realtionship between article and the comment model 
    has_many :comments
    
    validates :title, presence: true
    validates :author, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 20}

end
