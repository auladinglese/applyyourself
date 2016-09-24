class Resume < ApplicationRecord
  belongs_to :user
  has_many :reviews, :as => :commentable, dependent: :destroy
end
