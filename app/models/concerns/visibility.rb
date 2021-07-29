#concerns are used to avoid logic repetation, for instance to avoid repeating the archived? function.
#to add our status validation we'll need "The ActiveSupport::Concern" since they methods only called at class level.
module Visibility
    extend ActiveSupport::Concern
    # implementing the the status validation through status 
    VALID_STATUSES  =  ['public','private','archived']
    
    included do
    # defining a status function that's going to use the above statuses
    validates :status, inclusion: {in: VALID_STATUSES}
    end
    # adding a class method to help with the counting
    class_methods do
        def public_count
            where(status:'public').count
        end
    end
   

    def archived?
        status == 'archived'
    end
end
    