# Platebook
This is the back-end repository of our application. For the front-end repository, please visit [plate-book-fe](https://github.com/DysonBreakstone/plate-book-fe).\
\
Platebook is a license plate based social media website where anonymous users can share images of notable driving, make posts, and make comments on them. This serves as an alternative method for drivers to share their thoughts and hopefully reduce road aggression. By providing a platform for drivers to express themselves, it may provide a chance for drivers to express gratitude, address traffic safety concerns, or pursue missed connections.

## How to Use
Platebook is a social media platform that revolves around license plates.

Users must log in using Google OAuth to create new posts or comments.\
Visitors are free to peruse the site.

* Users can create a post and attach it to a new license plate or attach the post directly to an existing license plate.
* When creating a post, users can also attach a photo or provide the location of the incident the post is referring to.
* If a photo is provided, the photo will be displayed on the post's show page.
* If a location is provided, a marker that links to the posts's show page will be placed on the map in the landing page at the provided location.
* Users can leave comments on posts.
* Users can follow plates.
* Users can view their posts, comments, and followed plates on their dashboard.
* Users can search for specific plates or posts using the search box.

## Route Documentation 
[Swagger Documentation](https://app.swaggerhub.com/apis/ANDREWGBINGHAM/PlateBook_BE_Endpoints/1.0#/)

## Schema
![Screenshot 2023-06-08 at 8 03 21 PM](https://github.com/andrew-bingham1/plate-book-be/assets/119075417/7c02a1d5-859c-4e76-8941-086ca3c23adf)

## Built Using
* Rails 7.0.5
* Ruby 3.1.1
* Bootstrap 5
* AWS S3

## Deployment

### Docker Containers

A major goal of this project was to learn and use Docker containers. Docker containers are executable packages of software that can use OS-level virtualization for deployment, powered by a Containerization Engine. At a basic level, containerizing an application is a 3-step process:

1) Dockerfile
2) Docker Image
3) Docker Container

![Docker Containerization](https://github.com/DysonBreakstone/plate-book-fe/assets/86636108/41cc64fb-c17e-49c1-886c-e28efc4f7f71)

Applications can be packaged into Docker containers for deployment by creating a Dockerfile in the root of the application. The Dockerfile includes environment variables, CLI commands, and all of the configuration necessary to build the application into a Docker image. And then the Docker image can be used to instantiate a container and execute the application inside of it.

Docker containers are a modern virtualization solution that hold several advantages over traditional virtual machines. The core of its benefits largely stems from its ability to directly rely on the host operating system kernel so that it does not need to package the kernel itself. Instead, it only uses a minimal set of libraries that it needs to execute with the host operating system. This keeps Docker containers more lightweight, fast, efficient and portable than its virtual machine counterpart.

![The Anatomy of a Docker Container](https://github.com/DysonBreakstone/plate-book-fe/assets/86636108/59b4d7cb-d36f-45db-aa7d-118375973335)

The following tools were used in our Docker workflow:

1) Docker Desktop - required to execute the Docker CLI commands necessary to build and run locally
2) dockerfile-rails - a Ruby gem that automatically generates Dockerfiles and dock
3) docker-compose - a separate CLI that now comes with Docker Desktop, used to build and run multi-container applications. It automatically sets up a private VPN for containers to communicate to each other, configured from a `docker-compose.yml` file
4) DockerHub - Docker's cloud hosted repository for Docker images

Because our application is architected with a separate front end and back end, our application uses 2 containers which must be configured to talk to each other.

It is also important to note that Docker containers are intended to be stateless to take advantage of their speed and scalability. Therefore, Docker containers should not be used for production databases. However, they can still be suitable for a development workflow locally. Docker containers provide an alternative solution for data persistence in the form of volumes, which is a file system attached to the container which can be used as a data dump.

### Render Deployment

Front End: [plate-book-fe.onrender.com](https://plate-book-fe.onrender.com/)
Back End: [plate-book-be.onrender.com](https://plate-book-be.onrender.com/)

Our first deployment was done on Render, with 2 separate containers for the front end and back end, using a PostgreSQL database.

![Render Deployment](https://github.com/DysonBreakstone/plate-book-fe/assets/86636108/9a9a6837-e72c-41fe-b6d0-f36f4f9d5977)

### AWS Deployment

[platebook.net](https://platebook.net)

We additionally deployed on AWS as well to take advantage of AWS' Elastic Container Service (ECS). However, this required considerably more configuration to get fully working. ECS offers two compute platform options: Elastic Compute Cloud (EC2) or Fargate. Fargate is essentially just an abstraction on top of EC2, and the "serverless" alternative to EC2. With Fargate, AWS fully manages the EC2 instances for you and you only pay for what you use.

Both Fargate and EC2 have different pros and cons. With Fargate, much of the configuration is handled for you, and if you have very low and spotty usage, it can be considerably cheaper than EC2. However, it also means that your IP address will constantly change as the EC2 instances it is utilizing spin up and down. So handling this requires additional configuration as well.

With EC2, you have more control over the configuration and a consistent IP address to work with. However, unless your application has significant and consistent traffic, you will end up paying for a lot of unusued capacity.

We tried deploying both with Fargate and EC2, but we ultimately opted to go with Fargate because we were able to get the application running more consistently with Fargate. However, because Fargate does not have a permanent IP address for your application, it requires several more components to configure to handle the routing:

1) Application load balancer
2) Listener for the load balancer
3) Rules for the listener to identify how to redirect or forward traffic
4) Target to register the IP address for the EC2 instance (which is managed by Fargate, on the ECS cluster)

The application load balancer serves as the gateway to the application. The application load balancer has a listener attached that routes all traffic for a specific port (or protocol by its port - i.e. port 80 for HTTP traffic or port 443 for HTTPS traffic). The listener then has rules to determine where the traffic should go, which point to the target. And the service/task has a target where it registers/deregisters its IP address changes so that the current EC2 instance being managed by Fargate can be found.

Additionally, our deployment using AWS required additional HTTPS configuration so that the OAuth for our application would work. So we used AWS Route 53 to purchase the domain `platebook.net` and validate the Secure Sockets Layer (SSL) certificate for it. We then added our application load balancer's DNS name as a DNS A Record in our hosting zone for the domain on Route 53. This would handle the automatically HTTPS redirect to our application load balancer for the traffic to continue through the rest of our routing inside of our Virtual Private Cloud (VPC).

![AWS Deployment](https://github.com/DysonBreakstone/plate-book-fe/assets/86636108/5bc6b510-0d05-42ad-857e-a27989d2859e)

Our AWS workflow looked something like this:

1) Push Docker Images to AWS Elastic Container Repository (ECR)
2) Create a cluster on Elastic Constainer Service (ECS)
3) Create a task definition for instantiating and configuring the containers
4) Create a service on the cluster, configured to use the task definition, and set up the application load balancer, listener, and target

![AWS Workflow and Services](https://github.com/DysonBreakstone/plate-book-fe/assets/86636108/3e8efbaa-3596-402e-82e6-c22c85fbd3f2)

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
