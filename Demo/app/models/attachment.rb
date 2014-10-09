class Attachment < ActiveRecord::Base
  belongs_to :email

  validates :type, presence: true
end
