# frozen_string_literal: true

class ChangeBiolimit150 < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :bio, :text, limit: 150
  end

  def down
    change_column :users, :bio, :text
  end
end
