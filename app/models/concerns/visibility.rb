#concerns are used to avoid logic repetation, for instance to avoid repeating the archived? function.
#to add our status validation we'll need "The ActiveSupport::Concern" since they methods only called at class level.
module visibility
    extend ActiveSupport::Concern
    # implementing the the status validation through status 
    VALID_STATUSES  =  ['public','private','archived']
    
    include do
    # defining a status function that's going to use the above statuses
    validates :status, inclusion: {in: VALID_STATUSES}
    end

    def archived?
        status == 'archived'
    end
end
    