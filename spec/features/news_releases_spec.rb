require 'rails_helper'

describe NewsRelease, type: :model, focus: true do
  it "returns the formatted date and title as a string" do
    news_release = NewsRelease.new(released_on: '2013-07-31', title: 'BigCo hires a new CEO')

    expect(news_release.title_with_date).to eq '2013-07-31: BigCo hires a new CEO'
  end
end

feature "News releases", focus:true do
  context "as a user" do
    scenario "adds a news release" do
      user = create(:user)
      sign_in(user)
      visit root_path

      click_link "News"
      expect(page).not_to have_content "BigCo switches to Rails"

      click_link "Add News Release"
      fill_in "Date", with: "2013-07-29"
      fill_in "Title", with: "BigCo switches to Rails"
      fill_in "Body",  with: "BigCo has released a new website built with open source."
      click_button "Create News release"

      expect(current_path).to eq news_releases_path
      expect(page).to have_content "Successfully created news release."
      expect(page).to have_content "2013-07-29: BigCo switches to Rails"
    end
  end
end