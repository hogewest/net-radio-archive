class HibikiProgramV2 < ActiveRecord::Base
  include OndemandRetry
  enum episode_type: %i(normal additional)
end
