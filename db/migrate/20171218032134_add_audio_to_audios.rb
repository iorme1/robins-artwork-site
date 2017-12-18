class AddAudioToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :audio, :string
  end
end
