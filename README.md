# README
## CLI-RPN
1. High Level Description: 
CLI-RPN is an application that evaluates Reverse Polish Notation Expressions. It currently has 4 basic operators: Addition, Subtraction, Multiplication, and Division. Modulo, and Power operators are coming soon as well.
2. Architecture/Technical Choices for this application:
This application is a both web application, and an API (Application Program Interface). It uses ReactJS in the frontend to deliver a great user experience. In the backend it uses Ruby on Rails to implement new features very quickly.
This application renders React UI from the server (Server-Side Rendering) and for any subsequent requests, it communicates through it's own API to get results for the evaluations.

The architecture of this application is a modified version of Template Pattern. 



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
