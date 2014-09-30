class User < ActiveRecord::Base
  has_many :juniors, class_name: User, foreign_key: 'senior_id'
  belongs_to :senior, classname: User
end