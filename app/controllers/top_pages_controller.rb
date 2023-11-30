# frozen_string_literal: true

# Controller for handling top-level pages

class TopPagesController < ApplicationController
  skip_before_action :require_login

  def top; end
end
