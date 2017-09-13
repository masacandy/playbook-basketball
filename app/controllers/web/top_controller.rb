module Web
  class TopController < Web::BaseController
    def index
      @cources = Cource.last(5)
    end
  end
end
