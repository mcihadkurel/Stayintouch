# Stay In Touch

| [Milestone 1](https://github.com/mcihadkurel/Stayintouch/tree/milestone-1) | Entity Relationship Diagram (ERD) |

| [Milestone 2](https://github.com/mcihadkurel/Stayintouch/tree/milestone-2) | Friendship v1 |

### Milestone 3 (Friendship v2)

> In this milestone we have added a mutual friend feature.

> Amita is friend with Muhammed

> Oyeleke is friend with Muhammed

> So Muhammed is the mutual friend between Amita and Oyeleke

> Added test

![screenshot](./app/assets/images/ssm-3.png)
![screenshot](./app/assets/images/ss2m-3.png)

## Built With

- Ruby v2.7.2
- Ruby on Rails v5.2.4
- Rspec
- Capybara
- rubocop
- heroku

## Live Demo
https://touchinstay.herokuapp.com/


## Getting Started

To get a local copy up and running follow these simple example steps.İnitial

### Prerequisites

Ruby: 2.7.2
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

> for test formatting add below script in .rspec file

```
    rpsec --format documentation
```

> To run all the tests run below script in the terminal

`rspec`

### Deployment

- Create an account in heroku;
- Inside the project folder run heroku create
- Push the code to heroku git push heroku main
- Migrate your database heroku run rake db:migrateVisit your application heroku open

TBA

## Authors

👤 **Muhammed Cihad Kurel**

- Github: [@mcihadkurel](https://github.com/mcihadkurel)
- Twitter: [@mece_ka](https://twitter.com/mece_ka)
- LinkedIn: [@muhammed](https://www.linkedin.com/in/muhammed-cihad-8187581a8/)

👤 **Amita Roy**

- Github: [@Amita](https://github.com/Amita-Roy)
- Twitter: [@Amita](https://twitter.com/AmitaRoy14)
- Linkedin: [@Amita](https://www.linkedin.com/in/amita-roy-3b823b68/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

TBA

## 📝 License

TBA
