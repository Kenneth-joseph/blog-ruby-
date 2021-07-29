class Comment < ApplicationRecord
  #to bring the concern logic, we've got to include the visibility moduke from concern
  include Visibility
  # acknowledges the one to many realtionship 
  belongs_to :article 
end
