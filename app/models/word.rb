# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  ru         :string
#  en         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Word < ApplicationRecord
  belongs_to :user
  self.table_name = 'words'

  validates :ru, :en, presence: true, length: { minimum: 3, maximum: 30 }
  validates :en, uniqueness: true

end
