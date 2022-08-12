class PagesController < ApplicationController

  def index
    render json: { response: "Jesteś zalogowany"}
  end
end
