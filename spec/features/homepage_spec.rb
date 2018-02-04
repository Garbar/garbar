require 'rails_helper'

feature 'my home page' do
	scenario 'hello world message' do
		#Use capybara to auto complete forms and navigate	
		visit('/')
		expect(page).to have_content("Hello World!")
	end
end