# README
## CLI-RPN

### 1. High Level Description: 

CLI-RPN is an application that evaluates Reverse Polish Notation Expressions. It currently has 4 basic operators: Addition, Subtraction, Multiplication, and Division. Modulo, and Power operators are coming soon as well.
### 2. Architecture/Technical Choices for this application:

This application is a both web application, and an API (Application Program Interface).
The design pattern I chose for this application is a modified version of Template Pattern (As described in Design Patterns in Ruby by Russell A. Olsen). It differs from the well known pattern by removal of inheritance of methods. Therefore, developers can easily add/remove different types of Expression Type (Polish Notaion, Infix and etc) to further increase calculator's functionality.
Because it's an API, it allows different applications, such as mobile applications to also evaluate Reverse Polish Notation Expression.
### 3. Technology Stack:

Sketch for designing
Reasons for choosing Sketch:
1. Easy to use.
2. Built for designing mobile/web applications
3. Only $99 ($49 for students) one-time purchase

React for frontend
Reasons for choosing React:
1. Great support and community.
2. Fast performance due to its efficiency
3. Similar development approach for mobile applicationss (React-Native Apps)

Ruby on Rails for backend
Reasons for choosing Ruby on Rails:
1. One of the fastest framework to build prototypes
2. Elegant code
3. Library options (Gems)

PostgreSQL for database
Reasons for choosing Postgres:
1. Battle-tested
2. Advanced datatypes (ie. Array)
3. Implements SQL standards very well

CircleCI for Continuous Integration
Reasons for choosing CircleCI
1. No need to manually deploy
2. Runs test in separate parallel environments
3. Integrates with GitHub (indicator in GitHub to show if tests passed/failed)

Heroku for deployment
Reasons for choosing Heroku:
1. Very quick and simple to deploy Rails application
2. Free/Cheap cost for small projects
3. Easy integration with CircleCI

Docker for development
Reasons for choosing Docker:
1. Ability to quickly get Rails app up and running quickly.
2. Very portable 
3. Quick deployment using EC2 Container Service (AWS) or other platforms.

CloudFlare for HTTPS
1. Free for small projects
2. Very easy to set up
3. Many configurations 

### Tradeoffs

Deployment: 
I chose Heroku for the deployment platform. Although AWS is cheaper in the long run, simplicity of Heroku to set up a server, and free cost of small instances (postgreSQL, EC2) outweight the benefits of using AWS for this scenario.

Design Pattern:


## Setup

In order to get started:

Clone this repository by typing this command in the terminal:
```
git clone https://github.com/enoch232/CLI-RPN.git
```

As soon as you clone it, change directory to CLI-RPN, and then install bundler & install all dependency using bundler.
```
gem install bundler
bundle install (or you can just type 'bundle')
```

Then install Ruby 2.3.1 in terminal. In order to do that, you can use RVM or RBENV.

Rbenv:
```
rbenv install 2.3.1
rbenv local 2.3.1
```

Rvm:
```
rvm install 2.3.1
rvm 2.3.1
```

After cloning the repository into your workspace, create tables that are needed for rails app to run.
```
rake db:create
```

A last step before you run rails server, you need to perform a migration by:

```
bundle exec rake db:migrate
```

Then, you can start the server by:
```
rails server (or you can just type 'rails s')
```

You can now access the development server now
through any browsers (preferably Chrome Browser) by going to address of:
```
http://localhost:3000/
```

Congratulations!
