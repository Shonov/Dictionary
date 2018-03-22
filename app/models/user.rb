# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string(255)
#  email         :string(255)
#  password_hash :string(255)
#

require 'bcrypt'	
class User < ApplicationRecord

  attr_accessor :password, :password_confirmation
  validates :password, :confirmation => true,
                       :length => { minimum: 6},
                       :presence => true
  validates :email, uniqueness: true
	has_many :words
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
