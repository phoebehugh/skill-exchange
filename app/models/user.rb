class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :learnables
  has_many :shareables
  has_one :profile

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    if (User.admins.include?(data.email))
    # user = User.where(:email => data["email"]).first
      user = User.find_by(email: data.email)
      if user
        user.provider = access_token.provider
        user.uid = access_token.uid
        user.token = access_token.credentials.token
        user.save
        user
      else
    # unless user
        user = User.create(username: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
      end
    end
    user
  end
end
