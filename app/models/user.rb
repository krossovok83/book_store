# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # user.image = auth.info.image
    end
  end

  # def self.from_omniauth(auth)
  #   user = User.where(email: auth.info.email).first
  #   user ||= User.create!(provider: auth.provider, uid: auth.uid, name: auth.info.name, email: auth.info.email,
  #                         password: Devise.friendly_token[0, 20])
  #   user
  # end

  # def self.find_for_facebook_oauth(access_token)
  #   if user == User.where(url: access_token.info.urls.Facebook).first
  #     user
  #   else
  #     User.create!(provider: access_token.provider, url: access_token.info.urls.Facebook,
  #                  username: access_token.extra.raw_info.name, nickname: access_token.extra.raw_info.username,
  #                  email: access_token.extra.raw_info.email, password: Devise.friendly_token[0, 20])
  #   end
  # end
end
