require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "layout links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 4
		assert_select "a[href=?]", help_path
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", contact_path
		assert_select "a[href=?]", sign_in_path
		assert_select "a[href=?]", request_path
		assert_select "a[href=?]", data_path
		assert_select "a[href=?]", queries_path
	end
end
