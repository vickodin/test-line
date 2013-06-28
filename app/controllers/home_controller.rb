class HomeController < ApplicationController
  def index
    counter
    @line = Line.new
  end

  def create
    @line = Line.new(params[:line])
    respond_to do |format|
      format.html {
        if @line.save
          redirect_to root_path
        else
          flash[:alert] = 'Failed to save'
          redirect_to root_path
        end
      }
      format.js {
        @line.save
        counter
      }
    end
  end
  private
  def counter
    @counter = [Line.count, Russian.p(Line.count, "запрос", "запроса", "запросов")].join(' ')
  end
end
