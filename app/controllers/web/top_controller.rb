module Web
  class TopController < Web::BaseController
    def index
      @cources = Cource.where(active: true).last(5)
    end
  end
end
