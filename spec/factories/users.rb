# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'テスト用フルネーム' }
    username { 'テスト用ユーザーネーム' }
    password { 'password' }
  end
end
