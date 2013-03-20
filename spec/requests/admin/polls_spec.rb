require 'spec_helper'

describe "Polls" do
  stub_authorization!

  context "as admin user" do
    before(:each) do
      visit spree.admin_path
    end

    context "listing polls" do
      before do
        create(:poll, :name => 'am i handsome')
        create(:poll, :name => 'am i ugly')
      end

      context "sorting" do
        it "should list existing polls with correct sorting by name" do
          click_link "Polls"

          # Name ASC
          within_row(1) { page.should have_content('handsome') }
          within_row(2) { page.should have_content("ugly") }

          # Name DESC
          click_link "admin_polls_listing_name_title"
          within_row(1) { page.should have_content("ugly")  }
          within_row(2) { page.should have_content('handsome') }
        end
      end

      context 'delete a poll' do
        before do
          @poll = create(:poll, :name => 'am i smart')
        end

        pending 'should allow you to delete', js: true do

          click_link "Polls"
          page.find(".delete-resource").click

          page.driver.browser.switch_to.alert.accept

          # I can't figure out why i need to reload the page after a binding.pry to get the flash message to show up
          page.should have_content("successfully removed!")
          Spree::Poll.last.should_not == @poll
        end
      end

      context 'view the results of a poll' do
        before do
          @poll = create(:poll, :name => 'am i smart')
        end

        it 'should allow you to view the result' do

          click_link "Polls"
          find('#listing_polls tbody tr:nth-child(1) td:nth-child(1) a').click
          page.should have_content("#listing_poll_answers")
        end
      end

    end

    context "creating a new poll" do
      before(:each) do
        click_link "Polls"
        click_link "admin_new_poll"

      end

      it "should allow an admin to create a new poll", js: true do
        within('#new_poll') do
         page.should have_content("uestion")
        end

        fill_in "poll_name", :with => "Are you ugly"
        fill_in "poll_question", :with => "Are you ugly?"
        click_button "Create"
        page.should have_content("successfully created!")
      end

      it "should show validation errors" do
        click_button "Create"
        page.should have_content("Name can't be blank")
      end
    end

    context 'updating a poll' do
      let(:poll) { create(:poll) }

      before do
        visit spree.admin_poll_path(poll)
      end

      it 'should allow you to update' do
        fill_in "poll_question", :with => "are you a good person?"
        click_button "Update"
        page.should have_content("successfully updated!")
        Spree::Poll.last.question.should == 'are you a good person?'
      end

      context "configuring answers" do
        it 'should allow you to see all answers' do

          find('#listing_poll_answers tbody tr:nth-child(1)').text.should include('Yes')
          find('#listing_poll_answers tbody tr:nth-child(2)').text.should include('No')

          # TODO: ask scott why the above works but this:

          # within("#listing_poll_answers tbody") do
          #  within_row(1) { page.should have_content("Yes") }
          #  within_row(2) { page.should have_content("No") }
          #end

          # yielded:

          # Failure/Error: within_row(1) { page.should have_content("Yes") }
          # Capybara::ElementNotFound:
          # Unable to find css "table.index tbody tr:nth-child(1)"
          # end TODO

          visit spree.admin_poll_path(poll)
        end

        pending 'should allow you to add an answer', js: true do
          visit spree.admin_poll_path(poll)
          click_link ".add_nested_fields"
          fill_in "poll_answer_answer", :with => "green"
        end
        
        pending 'should allow you to remove an answer' do
          visit spree.admin_poll_path(poll)
          click_button "Update"
        end
        pending 'should allow you to edit an answer' do
          visit spree.admin_poll_path(poll)
          click_button "Update"
        end
      end
    end
  end
end
