class Store < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :avatar, :presence => {message: '経歴書を添付してください'}
end
