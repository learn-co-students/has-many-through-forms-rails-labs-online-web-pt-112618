class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }
  #ignore if user_attributes:[:username] is blank. (when we choose existing user from drop menu, we do not create a new user and user_attributes is going to be empty)
end
