require "spec_helper"


describe("visit the home page", {:type => :feature}) do
  it("tests home page") do
    visit("/")
    expect(page).to have_content("Welcome")
  end
end

describe("visit the brands page via the homepage", {:type => :feature}) do
  it("gets to the brand page") do
    visit("/")
    click_link("Brands")
    expect(page).to have_content("Brand")
  end
end
# describe("the brand creation path", {:type => :feature}) do
#   it("creates a brand") do
#     visit("/")
#     click_link("Brand")
#     expect(page).to have_content("Brand")
#     fill_in("name", with: "Nike")
#     fill_in("price", with: "10")
#     click_button("Add Brand")
#     expect(page).to have_content("Nike")
#     click_link("Nike")
#     expect(page).to have_content("New Brand Name")
#     fill_in("name", with: "New")
#     click_button("Update Brand")
#     expect(page).to have_content("New")
#   end
# end
