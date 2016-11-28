class Job < ApplicationRecord
	belongs_to :user
	has_many :covers, :as => :commentable, dependent: :destroy
end
