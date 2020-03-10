# frozen_string_literal: true

class ChangeNameAndUsernameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :username, false
  end
end
