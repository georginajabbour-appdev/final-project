# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  name                   :string
#  manager                :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
validates :name, presence: true
validates :name, uniqueness: {
scope: :email,
message: "Should be unique with respect to user email"
}

has_many :travellers, :class_name => "Participation", :dependent => :destroy
has_many :trips, :foreign_key => "manager_id", :dependent => :destroy
has_many :roomate_requests, :foreign_key => "requestor_id", :dependent => :destroy
has_many :roomate_invitations, :class_name => "RoomateRequest", :foreign_key => "recipient_id", :dependent => :destroy

end
