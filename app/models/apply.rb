class Apply
  include ActiveModel::Model
  require 'carrierwave/orm/activerecord'
  #mount_uploader :avatar, AvatarUploader
  attr_accessor :name, :email, :birthdate, :sex, :message, :project_id, :avatar, :file_path

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
end
