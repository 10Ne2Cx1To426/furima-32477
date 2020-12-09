class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' }, length: { minimum: 6 }, confirmation: true do
    validates :password
  end

  validates :password_confirmation, presence: true

  with_options presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '@を含めて入力してください' }, uniqueness: { case_sensitive: false } do
    validates :email
  end

  validates :nickname, presence: { message: 'ニックネームを入力してください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_k
    validates :last_name_k
  end
    
  validates :birth, presence: { message: '生年月日を入力してください'}
end
