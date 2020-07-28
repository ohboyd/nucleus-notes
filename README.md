# README

[![Codeship Status for ohboyd/nucleus-notes](https://app.codeship.com/projects/606edc30-ac99-0138-3e80-1a43eebcb420/status?branch=master)](https://app.codeship.com/projects/403406)


# Nucleus Notes
A useful notes application to keep track of daily notes, and all the tasks on your todo list.

## Technologies

- Rails 6.0

- Ruby 2.5

- The deployment pipeline moves from GitHub -> CodeShip CI -> Heroku

- AWS S3 & Active Storage for imbedded images and other attachments

- Action Text for user-friendly Rich Text formatting

- Webpacker for js assets, Sprockets for the SCSS and images

- Bootstrap for the design (along with popper and jquery)

- Validations are unit tested within rspec model tests


## Worthwhile Gems

- [devise](https://github.com/heartcombo/devise) for robust authentication

- [pundit](https://github.com/varvet/pundit) for simple, scalable authorization

- [dotenv](https://github.com/bkeepers/dotenv) for loading environment variables easily

- [faker](https://github.com/faker-ruby/faker) to generate fun mock data for the seeds

- [rspec](https://github.com/rspec/rspec-rails) for the test suite

- [factory bot](https://github.com/thoughtbot/factory_bot_rails) to generate quasi-fixtures for easy testing
