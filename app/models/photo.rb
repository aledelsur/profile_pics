class Photo < ActiveRecord::Base

  attr_accessible :photo, :photo_content_type

  has_attached_file :photo,
   :styles => { :small => "170x200#"}, 
    :storage => :s3,
    :bucket => "profile_pics",
    :s3_options     => {
    :server => "s3-website-us-east-1.amazonaws.com"},
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/#{Rails.env}/photos/:attachment/:style/:id/:filename"
end
