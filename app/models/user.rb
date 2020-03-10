# frozen_string_literal: true

# ユーザーアカウントの管理
class User < ApplicationRecord
  has_secure_password
end
