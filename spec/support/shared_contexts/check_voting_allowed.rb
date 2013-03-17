shared_context "check_voting_allowed" do
  def check_voting_allowed
    save_and_open_page
    binding.pry
   page.should have_selector("#new_poll_list")

   page.find("input[type=radio]").click
   click_link I18n.t(:vote)
   
   page.should have_content(I18n.t(:thanks_for_voting))
   page.should have_selector("#poll_results_list")
  end
end
