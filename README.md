# Platebook
This is the front-end repository of our application. For the back-end repository, please visit [plate-book-fe](https://github.com/andrew-bingham1/plate-book-be).\
\
Platebook is a license plate based social media website where anonymous users can share images of notable driving, make posts, and make comments on them. This serves as an alternative method for drivers to share their thoughts and hopefully reduce road aggression. By providing a platform for drivers to express themselves, it may provide a chance for drivers to express gratitude, address traffic safety concerns, or pursue missed connections.

## How to Use
Platebook is a social media platform that revolves around license plates.

Users must log in using Google OAuth to create new posts or comments.\
Visitors are free to peruse the site.\
\
Users can create a post and attach it to a new license plate or attach the post directly to an existing license plate.\
When creating a post, users can also attach a photo or provide the location of the incident the post is referring to.\
If a photo is provided, the photo will be displayed on the post's show page.\
If a location is provided, a marker that links to the posts's show page will be placed on the map in the landing page at the provided location.\
Users can leave comments on posts.\
Users can follow plates.\
Users can view their posts, comments, and followed plates on their dashboard.\
Users can search for specific plates or posts using the search box.

## Routes
https://app.swaggerhub.com/apis/ANDREWGBINGHAM/PlateBook_BE_Endpoints/1.0#/

## Built Using
* Rails 7.0.5
* Ruby 3.1.1
* Bootstrap 5
* AWS S3

## Deployment
The front-end repository was deployed using\
The back-end repository was deployed using\
The database is hosted was deployed using

## How to Install Locally
Ensure you have the correct versions of Ruby and Ruby on Rails installed.

1. In your terminal, navigate to the directory you would like to host the repository in.

2. Clone the project repository:
```
git clone git@github.com:andrew-bingham1/plate-book-be.git
```
3. Clone [plate-book-fe](https://github.com/DysonBreakstone/plate-book-fe):
```
git clone git@github.com:DysonBreakstone/plate-book-fe.git
```
4. Run `bundle install` in both repositories in your terminal to install project gems.

5. In the back-end repository, run these commands to initialize the databases and set up database structure:

```
rails db:drop
rails db:create
rails db:migrate
```

6. Run the `bundle exec rspec` command in both directories to see all of the Rspec tests run and ensure the program is running properly.

7. Run `rails s` in both the back-end and front-end repositories.

8. Navigate to [localhost:3000](http://localhost:3000/) in your browser to explore!

## Testing

- To run tests for this app, type the following command in your terminal from inside the cloned project folder:

```
bundle exec rspec spec
```

This application uses the `Simplecov` gem to monitor test coverage. Current coverage is at 100% for the back-end and 98% for the front-end.

## Contributors

Andrew Bingham

- [GitHub](https://github.com/andrew-bingham1)
- [LinkedIn](https://www.linkedin.com/in/andrew-bingham1/)

Branden Ge

- [GitHub](https://github.com/brandenge)
- [LinkedIn](https://www.linkedin.com/in/brandenge/)

Dyson Breakstone

- [GitHub](https://github.com/DysonBreakstone/plate-book-fe)
- [LinkedIn](https://www.linkedin.com/in/dyson-breakstone-4978291a2)

Young Heon Koh

- [GitHub](https://github.com/kohyoungheon)
- [LinkedIn](https://www.linkedin.com/in/kohyoungheon/)
