# Billie

Billie is a book management application to help you keep up with your physical library. 
Scan a book with your phone or search into our database to put your collection into a digital library.
Billie is a freemium application developed in open source.

## Summary

  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Built With](#built-with)
  - [Contributing](#contributing)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Getting Started

If you want to contribute, please follow the instructions below.
Go on the [Notion](https://www.notion.so/Billie-67df0c1838604414b76cbf8a6023c29e) to find a ticket in our backlog. If you have any idea just create a ticket.

### Prerequisites

What things you need to install the software and how to install them

    Ruby 2.6

### Installing

A step by step series of examples that tell you how to get a development
env running

For it's first launch run the following command :

    bundle install

Create the db

    rails db:create

Then run the migrations

    rails db:migrate

End with an example of getting some data out of the system or using it
for a little demo

<!-- ## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

    Give an example

### And coding style tests

Explain what these tests test and why

    Give an example -->

<!-- ## Deployment

Billie is deployed with Heroku -->

## Built With

  - [Ruby on Rails](https://rubyonrails.org/) - Ruby Framework
  - [Devise](https://github.com/heartcombo/devise) - Gem to authenticate users
  - [Pundit](https://github.com/varvet/pundit) - Gem to authorise users to perform actions
  - [PostgreSQL](https://www.postgresql.org/) - Relational database
  - [SASS](https://sass-lang.com/) - CSS extensions
  - [Stripe](https://stripe.com/fr) - Payment solution for the freemium side
  - [Github Actions](https://docs.github.com/en/actions) - Continuous Integration(CI) tool
  - [Rspec](https://rspec.info/) - Gem to test ruby code
  - [Act as taggable](https://github.com/mbleigh/acts-as-taggable-on) - Gem to add tags to books


## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code
of conduct, and the process for submitting pull requests to us.

<!-- ## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this
repository](https://github.com/PurpleBooth/a-good-readme-template/tags). -->

## Authors

  - [**junkiesan**](https://github.com/junkiesan)

See also the list of
[contributors](https://github.com/junkiesan/billie/contributors)
who participated in this project.

<!-- ## License

This project is licensed under the [CC0 1.0 Universal](LICENSE.md)
Creative Commons License - see the [LICENSE.md](LICENSE.md) file for
details -->

<!-- ## Acknowledgments

  - Hat tip to anyone whose code was used
  - Inspiration
  - etc -->