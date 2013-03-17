module Spree
  module Admin
    class PollAnswersController < ResourceController
      def index
        respond_with(@collection)
      end

      def collection
        @poll = Poll.find params[:id]
        @collection = @poll.poll_answers 
      end
    end
  end
end
