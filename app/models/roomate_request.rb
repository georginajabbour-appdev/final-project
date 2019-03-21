# == Schema Information
#
# Table name: roomate_requests
#
#  id           :integer          not null, primary key
#  requestor_id :integer
#  recipient_id :integer
#  approved     :boolean
#  hotel_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RoomateRequest < ApplicationRecord

validates :requestor_id, :recipient_id, :hotel_id, presence: true
validates :requestor_id, uniqueness: { scope: :hotel_id,
message: "User can only invite one person to room per hotel" 
}

validate :recipient_id_cannot_be_requestor_id
    
  def recipient_id_cannot_be_requestor_id
    if recipient_id == requestor_id
      errors.add(:recipient_id, "cannot be requester")
    end
  end


    
belongs_to :requestor, :class_name => "User"
belongs_to :recipient, :class_name => "User"
belongs_to :hotel

end
