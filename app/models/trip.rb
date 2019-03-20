# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  name        :string
#  manager_id  :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trip < ApplicationRecord

validates :name, :description, presence: true

belongs_to :manager, :class_name => "User"
has_many :travellers, :class_name => "Participation", :dependent => :destroy
has_many :legs, :dependent => :destroy
        

end
