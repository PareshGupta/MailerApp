class Attachment < ActiveRecord::Base
  # FIXME_AK: Why is should be polymorphic?
  belongs_to :email, polymorphic: true
end
