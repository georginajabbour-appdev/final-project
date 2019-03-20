# == Schema Information
#
# Table name: legs
#
#  id         :integer          not null, primary key
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Leg < ApplicationRecord
    
validates :trip_id, presence: true
validates :id, uniqueness: { scope: :trip_id,
message: "Each trip has its own legs" 
}
    
belongs_to :trip
has_many :hotels, :dependent => :destroy
    
    
end
