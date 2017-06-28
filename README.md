# README

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
