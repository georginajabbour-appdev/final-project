# == Schema Information
#
# Table name: participations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participation < ApplicationRecord
    
validates :user_id, :trip_id, presence: true
validates :user_id, uniqueness: { scope: :trip_id,
message: "User already is registered in the trip" 
}
    
    
belongs_to :user
belongs_to :trip
    
end
