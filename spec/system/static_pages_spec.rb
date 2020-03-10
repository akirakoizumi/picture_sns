# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'static_pages/home.html.slim', type: :system do
  describe 'ページタイトルの表示' do
    before do
      visit root_path
    end

    it '正しいタイトルが表示されている' do
      expect(page).to have_title 'Home | PictureSns'
    end
  end
end
