class Cat < ActiveRecord::Base
  belongs_to :owner
  belongs_to :breed

  validates :name, :owner_id, :breed_id, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end

# == Schema Information
#
# Table name: cats
#
#  id                  :integer          not null, primary key
#  name                :string
#  owner_id            :integer
#  breed_id            :integer
#  dob                 :date
#  allergies           :string
#  vet_name            :string
#  vet_phone           :string
#  in_daycare          :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_cats_on_breed_id  (breed_id)
#  index_cats_on_owner_id  (owner_id)
#
