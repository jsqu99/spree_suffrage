require 'spec_helper'
require 'support/shared_contexts/check_voting_allowed'

describe "Polls" do
  include_context "check_voting_allowed"
  let!(:product) { # force the sidbare to be loaded
    product = create(:product) 
    product.taxons << create(:taxon)
  } 
  let(:poll) { create(:poll, :name => 'am i handsome', :allow_view_results_without_voting => false) }
  let(:user) { create(:user) }

  before(:each) do
    Deface::Override.new(name: 'add_poll_to_home_page', 
                         virtual_path: 'spree/shared/_sidebar', 
                         insert_top: '#sidebar[data-hook],[data-hook=sidebar]', 
                         partial: 'spree/polls/poll')
    visit spree.root_path
  end

  context "not voted in this poll" do
    context "as a logged in user" do
      it "should allow me to vote", js: true do

        sign_in user

        check_voting_allowed
      end
    end
    context "as an anonymous user" do
      it "should allow me to vote" do
        check_voting_allowed
      end
    end

    context "view poll results before voting" do
      context "viewing results is allowed for poll" do
        before do
          poll.update_attributes(allow_view_results_without_voting: true)
        end

        it "should not show the 'view results' link if there hasn't been any voting yet" do
          visit spree.root_path
          
          page.should_not have_link(I18n.t(:view_poll_results))
        end        

        it "should allow me to see the results" do
          vote = Spree::PollVote.new
          vote.poll_answer_id = poll.poll_answers.first.id
          vote.ip_address = '1.2.3.4'
          vote.save!

          visit spree.root_path

          click_link I18n.t(:view_poll_results)
          page.should have_selector("#poll_results_list")
        end
      end
      context "viewing results is not allowed" do
        it "should allow me to see the results" do
          page.should_not have_link(I18n.t(:view_poll_results))
        end
      end
    end
  end

  context "already voted in this poll" do
    context "logged in user" do
      it "should show me the poll results" do
        sign_in user

        page.should have_selector("#poll_results_list")
      end
    end
    context "anonymous user" do
      it "should show me the poll results" do
        page.should have_selector("#poll_results_list")
      end
    end
  end

end
