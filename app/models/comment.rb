class Comment < ApplicationRecord
  belongs_to :post
  broadcast_to :post
end
