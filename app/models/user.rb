class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /¥A[一-龥]+¥z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /¥A[ァ-ン]+¥z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  VALID_PASSWORD_REGEX =/¥A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[¥d])¥w{6,}¥z/
  validates :password, presence: true,format: { with: VALID_PASSWORD_REGEX}

  validates :birth_date, presence: true
end
