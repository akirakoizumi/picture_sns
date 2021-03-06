# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to current_user
    end
  end

  def terms; end
end
