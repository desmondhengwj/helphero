class Comment < ApplicationRecord
  belongs_to :helper
  belongs_to :user
end
