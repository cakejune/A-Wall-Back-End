class Friend < ApplicationRecord
  belongs_to :requestor, class_name: 'User'
  belongs_to :acceptor, class_name: 'User'
end
