# README

This README would normally document whatever steps are necessary to get the
application up and running.


# UPDATING FILES
* Download ZIP & extract
* Open command prompt and cd into proximy-master
* Enter these commands:
  * `gem uninstall bcrypt`
    * Enter `3` (or whatever number is associated with "All Versions")
    * Enter `y`
  * `gem uninstall bcrypt-ruby`
  * `gem install bcrypt --platform=ruby`
  * `bundle install`
  * `rails db:migrate RAILS_ENV=development`
* Run ruby server with `rails s`
