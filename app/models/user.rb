require "open-uri"

class User < ActiveRecord::Base

  has_many :authentications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :name, :provider, :uid, :oauth_token, :avatar


  has_attached_file :avatar,
    :styles => {
      :small=> "100x100#"}

  def info
    {
      :avatar => self.avatar,
      :name   => self.name,
      :count => self.count_users,
    }
  end

  def self.count_users
    User.all.size
  end

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def self.picture_from_url(url)
    avatar = open(url)
  end  


end
