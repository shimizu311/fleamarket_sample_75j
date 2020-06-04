class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials
  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_one :user_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  validates :nickname, :year, :month, :day, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :j_surname, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :j_name, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
