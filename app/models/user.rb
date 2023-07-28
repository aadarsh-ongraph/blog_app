class User < ApplicationRecord
    has_many :userblogs
    has_many :likes
end
