class Attachment < ActiveRecord::Base
  belongs_to :e_mail, polymorphic: true
end
