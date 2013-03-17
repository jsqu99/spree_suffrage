module Spree
  class PollResultsController < Spree::StoreController
    def show
      @poll = Poll.find(params[:poll_id])
      
      if @poll.allow_view_results_without_voting || session[:vote_id]
        session[:show_poll_results_without_voting_id] = @poll.id
      else
        @poll = nil
        flash[:error] = I18n.t(:sorry_you_must_vote_to_view)
      end

      redirect_to(:back) 
    end
  end
end
