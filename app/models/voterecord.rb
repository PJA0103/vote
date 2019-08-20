class Voterecord < ApplicationRecord
  belongs_to :player , counter_cache: true

end
