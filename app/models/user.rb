class User < ApplicationRecord
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy


  def self.find_for_facebook_oauth(auth)
    email = auth.info.email

    if not email.present?
      email = "#{Devise.friendly_token[0,20]}@email.com"
    end

    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: email).first # User did a regular sign up in the past.

    attributes = {
                    first_name: auth.info.first_name,
                    last_name: auth.info.last_name,
                  }

    if user
      user.update(user_params)
      user.profile.update({remote_avatar_picture_url: auth.info.image})
    else
      user = User.new(user_params)
      user.email = email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save

      profile = Profile.new(attributes)
      profile.user = user
      profile.remote_avatar_picture_url = auth.info.image
      profile.save
    end

    return user
  end

  def name
    self.email
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end




