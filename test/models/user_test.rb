require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:michiel).profile_name
  	assert !user.save, "Saved the user with no unique profile name"
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "My profile with spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?, "Saved the user with spaces in their profile name"
  	assert user.errors[:profile_name].include?("must be formatted correctly.")
  end

end
