class HomeController < ApplicationController
  def index
    counter
    @line = Line.new
    @lines = Line.where(:session_id => session[:session_id]).limit(10).order('id desc')
  end

  def create
    @line = Line.new(params[:line])
    @line.session_id = session[:session_id]
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
    amount = Line.count(:conditions => {:session_id => session[:session_id]})
    @counter = [amount, Russian.p(amount, "запрос", "запроса", "запросов")].join(' ')
  end
end
