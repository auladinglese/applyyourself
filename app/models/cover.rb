class Cover < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :covers, :as => :commentable
  includes Bootsy::Container

  def job
    return @job if defined?(@job)
    @job = commentable.is_a?(Job) ? commentable : commentable.job
  end
end
