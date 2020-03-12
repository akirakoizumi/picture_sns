# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  describe '新規登録機能' do
    before do
      user_a = FactoryBot.create(:user)
      visit signup_path
      fill_in 'フルネーム', with: 'テスト用フルネーム'
      fill_in 'ユーザーネーム', with: 'テスト用ユーザーネーム'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認）', with: 'password'
      click_button '登録する'
    end
    it '登録完了して詳細ページにアクセスする' do
      expect(page).to have_content 'ユーザーの詳細'
    end
  end
end
