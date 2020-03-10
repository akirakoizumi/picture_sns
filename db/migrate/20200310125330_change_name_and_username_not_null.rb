# frozen_string_literal: true

class ChangeNameAndUsernameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :name, false
    change_column_null :tasks, :username, false
  end
end
