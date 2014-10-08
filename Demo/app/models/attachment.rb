class Attachment < ActiveRecord::Base
  # FIXME_AK: Correct association name here.
  # FIXME_AK: Why is should be polymorphic?
  belongs_to :e_mail, polymorphic: true
end
