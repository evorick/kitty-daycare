require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
