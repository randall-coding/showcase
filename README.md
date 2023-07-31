# Showcase website
Showcase of my recent work in web development

## Specs
Running Rails 6.1.7 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Ruby version 2.7.6  &nbsp;&nbsp;&nbsp; Rspec 3.8/Capybara 3.12.  &nbsp;&nbsp;&nbsp; PostgreSQL database. &nbsp;&nbsp;&nbsp; <br>  Deployed on Heroku

## Features
* Recent web development work (Ruby on Rails)

* Other software development (such as MATLAB for data analysis)

* Demos of several external APIs including Ethereum blockchain scanner

* Contact form to e-mail me directly

* Javascript/Jquery animations demonstration

## Tests
* Run test suites with `bundle exec rspec spec` after installing rspec with `rails generate rspec:install`
* Tests are up to date and passing

## Updates
* Making portfolio items REST resources
* UI changes
  * Making top navbar
  * Using AJAX rendering on tabs

## Docker
docker build . -t showcase
docker run -p 3000:3000 showcase

