class StaticPagesController < ApplicationController
  def index
    render file: "public/client.html"
  end
end