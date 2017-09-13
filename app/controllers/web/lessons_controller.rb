module Web
  class LessonsController < Web::BaseController
    def show
      @cource = Cource.find(params[:cource_id])
      @lesson = Lesson.find(params[:id])
    end
  end
end
