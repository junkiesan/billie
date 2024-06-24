# Billie

Billie is a book management application to help you keep up with your physical library.
Scan a book with your phone or search into our database to put your collection into a digital library.
Billie is a freemium application developed in open source.

Billie is **100% open source**, and we fully welcome **contributions to the code**!

For more detailed information and tips on **contributing**, please Read our [CONTRIBUTING.md](CONTRIBUTING.md) documentation.
You will found more detailled informations in our Wiki.

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

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code
of conduct, and the process for submitting pull requests to us.

Feel free to browse through the issues and see if you can help us in one or multiple of them:

Then please follow the instructions below.

-->- If you want to add some code, fork from the branch `master` and merge request to the branch `master`.

# -->- If you want to add some code, fork from the branch `develop` and merge request to the branch `develop`! Any request to `master` will be automatically rejected.

### How to report a bug or request a feature.

Please have a quick check through our [open issues ](https://github.com/junkiesan/billie/issues) to see if your issue/problem/request has already been reported.
If so, you can click on 👍 to indicate that you have the same issue, and you can add a comment to the issue to give more detail. If not, go ahead and create your new issue using this link.

## Getting Started

- **List view** - View on Notion: [Notion](https://www.notion.so/Billie-67df0c1838604414b76cbf8a6023c29e) to find a ticket in our backlog regarding UX/UI, Product questions. If you have any ideas just create a ticket.

-**List view** - View on Github Issue: [Issues-list](https://github.com/junkiesan/billie/issues) to find a ticket in our developer backlog. If you have any ideas or discover a bug, you can create and submit an issue.

- **Board view** - View a Trello-like view of the issues listed by priority and state (to do, doing, ready/review): [dev-project](https://github.com/junkiesan/billie/projects/1).

We highly recommend you setup a SSH key with your Github account (https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), but this is up to you.

In you **code** repository, create a folder **Junkiesan**
`$ mkdir junkiesan`

then in this folder Clone the repository with SSH `git@github.com:junkiesan/billie.git` or https `https://github.com/junkiesan/billie.git`

Navigate the repository
`$ cd billie/app`

Make sure you are onto the master branch
`$ git checkout develop`

Create a new branch for your feature or bug correction
`$ git checkout -b MyNewBranch`

For best practice to name a new branch, please read our [CONTRIBUTING.md](CONTRIBUTING.md) code of conduct.

### Prerequisites

What things you need to install the software and how to install them

    Ruby 2.6

### Launching the app

A step by step series of examples that tell you how to get a development
env running

For it's first launch and every time a new gem is installed run the following command :

    $ bundle install

Create the db

    $ rails db:create

Then run the migrations

    $ rails db:migrate

_Every time a migration is added, don't forget to run the migration._

End with an example of getting some data out of the system or using it
for a little demo

## Running the tests

We're using Rspec and capybara to test the codebase.

In the rspec directory run the following command:

`$ rpsec spec/directory_name/name_of_file_spec.rb`

Example to run the book models tests
`$ rspec spec/models/book_spec.rb`

<!-- ### Break down into end to end tests

Explain what these tests test and why

    Give an example

### And coding style tests

Explain what these tests test and why

    Give an example

## Deployment

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

<!-- ## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this
repository](https://github.com/PurpleBooth/a-good-readme-template/tags). -->

## Authors

- [**junkiesan**](https://github.com/junkiesan)
- [**Isalafont**](https://github.com/Isalafont)

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
