class TagsController < ApplicationController
  def tag
    @tag_list = Tag.all
  end
end
