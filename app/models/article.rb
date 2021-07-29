class Article < ApplicationRecord
    # update the realtionship between article and the comment model 
    has_many :comments
    #from the forms fields, to ensure the data coming through is validated and the fields are filled s required we validate the fields from the models here
    validates :title, presence: true
    validates :author, presence: true, length: {minimum: 5}
    validates :body, presence: true, length: {minimum: 20}
    # implementing the the concerns through status 
    VALID_STATUSES  =  ['public','private','archived']
    validates :status, inclusion: {in: VALID_STATUSES}
    # defining a status function that's going to use the above statuses
    def archived?
        status == 'archived'
    end
end
