# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  leg_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hotel < ApplicationRecord
    
validates :name, :user_id, :leg_id, presence: true
validates :name, uniqueness: { scope: :leg_id,
message: "Hotel is already available for this leg of the trip" 
}
    
has_many :roomate_requests, :dependent => :destroy
belongs_to :trip, :class_name => "Leg", :foreign_key => "leg_id"    
    
end
