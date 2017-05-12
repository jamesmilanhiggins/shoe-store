require "spec_helper"


describe("visit the home page", {:type => :feature}) do
  it("tests home page") do
    visit("/")
    expect(page).to have_content("Welcome")
  end
end

describe("visit the stores page via the homepage", {:type => :feature}) do
  it("gets to the store page") do
    visit("/")
    click_link("Stores")
    expect(page).to have_content("Add Store")
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
describe("the store creation path", {:type => :feature}) do
  it("creates a store") do
    visit("/")
    click_link("Stores")
    expect(page).to have_content("Add Store")
    fill_in("name", with: "James")
    click_button("Add Store")
    expect(page).to have_content("James")
    click_link("James")
    expect(page).to have_content("Add Brands")
    click_button("Delete this Store")
    expect(page).to have_content("Add Store")
  end
end
