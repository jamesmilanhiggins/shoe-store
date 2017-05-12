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
    expect(page).to have_content("Add Brand")
  end
end
describe("the store creation path", {:type => :feature}) do
  it("creates a store") do
    visit("/")
    click_link("Stores")
    expect(page).to have_content("Add Store")
    fill_in("name", with: "James")
    click_button("Add Store")
    expect(page).to have_content("James")
  end
end
