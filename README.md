### Authors

[A Erbay](https://github.com/kermit-klein)

## Built with

**Front/Back End:** Rails v.6.0.3.2 | Ruby 2.5.1
**Testing framework:** Rspec  
**Deployed at:** https://ali-aut-2020.herokuapp.com/

## The code

This is the first project that I have done in Ruby on Rails and the main focus was to understand the architecture of Rails and how the different parts work together.

The project it self is to build a website where the user can create, read, edit and also delete articles. In order to create articles user must sign up and login to the website.(Devise gem is used)

## Getting Started

### Dependencies

- rspec-rails
- shoulda-matchers
- factory_bot_rails
- capybara
- coveralls

### Setup

To run this application you should do following steps:
To get the application on your local device:
`$ git clone https://github.com/kermit-klein/rails_demo`

To uninstall the gems that are used:
`$ bundle`

Create the database locally:
`$ rails db:create db:migrate`

### Instructions

To use the application
Start the rails server locally
`$ rails s`

Then you can visit the application in your browser by typing in "localhost:3000" and try out the functionalities.

## License

[MIT-license](https://en.wikipedia.org/wiki/MIT_License)

### Acknowledgement

- Material provided by [Craft Academy](https://craftacademy.se)
