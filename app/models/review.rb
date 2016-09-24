class Review < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
  has_many :reviews, :as => :commentable
  includes Bootsy::Container
  belongs_to :user
  
  def resume
    return @resume if defined?(@resume)
    @resume = commentable.is_a?(Resume) ? commentable : commentable.resume
  end
end
