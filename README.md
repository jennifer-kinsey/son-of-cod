# Son of Cod - A fine fish market

This is a Ruby on Rails web app. Fictitious and semi-blasphemous store Son of Cod sells various fish.

There are two user types: admins and users; plus visitors who are not logged in.

* Visitors can: visiting landing page, see all the fish(product), go to an individual fish page
* Users can:  all the above - and add reviews on fish
* Admins can: all the above plus - add, edit, or delete fish(product), and delete user reviews


This demonstrates use of authentication with authorization, use of testing gems to streamline and ensure quality of testing, seeding data from faker gem, use of scopes, unit and integration testing, proper route convention, and use of success and error messages.


## Screenshots

### Homepage


## Products Page

## Individual Product Page



# Setup

Required:

* Ruby version 2.4.1

* Bundle

Git clone this repo:
```
git clone https://github.com/jennifer-kinsey/son-of-cod.git
```

Run Bundle

```
bundle install
```

* Database creation and initialization

This app uses Postgres for database storage. Please ensure Postgres is running in the background before executing the following command. If it is not running and is present on the machine you can simply open a new terminal window and run:

```
postgres
```

If it is up and running, you can move on to creating, initializing, and seeding the database with the next command:

```
bundle exec rake db:setup
```



* How to run the test suite

```
rspec
```

* Deployment instructions

Launch Rails:

```
rails server
```

If all goes well you should be able to launch the app in your browser at http://localhost:3000/


## Authors

* Jennifer Kinsey

### Technologies Used

* Ruby
* Bundler
* Postgres
* Rails
* Javascript (ES6)
* HTML5
* SASS
* RSpec with Capybara
* Shoulda Matchers and FactoryGirl to simplify testing
* SimpleCov for testing coverage
* bCrypt for user authentication
* Faker for seeding up a database


## License

MIT License

Copyright (c) 2017 Jennifer Kinsey

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
