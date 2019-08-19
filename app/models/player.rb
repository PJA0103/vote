class Player < ApplicationRecord

    validates :name , presence:true
    has_many :voterecord
end
