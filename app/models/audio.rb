class Audio < ActiveRecord::Base
  mount_uploader :audio, AudioUploader
end
