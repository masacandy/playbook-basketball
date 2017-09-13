module Web
  class CourcesController < Web::BaseController
    def show
      @cource = Cource.find(params[:id])
    end
  end
end
