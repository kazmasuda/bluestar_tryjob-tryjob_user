class Contact
  include ActiveModel::Model
  #mount_uploader :avatar, AvatarUploader
  attr_accessor :name, :enterprise, :post, :email, :tell, :message

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :enterprise, :presence => {:message => '会社名を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :tell, :presence => {:message => '電話番号を入力してください'}
  validates :message, :presence => {:message => 'メッセージを入力してください'}
end
