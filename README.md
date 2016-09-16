# Ruby on Rails Tutorial

This is a working tutorial for setting up your first Ruby App.

## Necessary ingrediants
* Ruby
* Bundler
* mySql

### Install Ruby
I am using [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build).  Others may use [rvm](https://rvm.io/) or some other Ruby version manager.

To get these tools, I'm using [homebrew](http://brew.sh/)

### Install rbenv
```
brew install rbenv
```

```
brew install ruby-build
```

### Install Ruby
Check what the latest version is either on [Ruby-lang](https://www.ruby-lang.org/en/) or through `rbenv`
```
rbenv install --list
```
Then install whichever version you want:
```
rbenv install 2.3.1
```
You will need to run `rehash` to install shims.
```
rbenv rehash
```
And then set global ruby to use whichever version you want.
```
rbenv global 2.3.1
```

### Install Rails and Bundler
[Bundler](http://bundler.io/) is the best way to manage your Gemfile
```
gem install bundler
```

You probably don't need docs cause they're much better online.
```
gem install rails --no-ri --no-rdoc
```

### Install MySQL
Again, I'm using [homebrew](http://brew.sh/)
```
brew install mysql
```

#### Make sure you run mysql before starting the app
```
mysql.server start
```

## Install the gems
```
bundle install
```

## Run the demo app
```
rails server
```

## Navigating this tutorial
[Each of the commits](https://github.com/kinseyost/ruby-tutorial/commits/master) represent a lesson, to follow along go through each of the commits to see what the lesson entails.  Most of them are explained pretty well through the commit message.

## rails Generate
One of the most powerful features of Rails is the ability to generate scaffolding.

To see what kind of generation you can perform
```
rails generate
```

### Generate new controller/views
```
rails generate controller <controllerName> <viewName>
```

## Database
Create a database in mysql
1. Login
```
mysql -u root
```
2. Create database
```
CREATE simple_cms_development;
```
3. Create a new user and password so you don't have to use *root* for everything.
```
CREATE USER 'whateverUsernameYouDesire'@'localhost';
```
Give permissions to user.
```
GRANT ALL PRIVILEGES ON simple_cms_development.*
TO 'whateverUsernameYouDesire'@'localhost'
IDENTIFIED BY 'whateverPasswordYouDesire';
```
You can now check the privileges of that user.
```
SHOW GRANTS FOR whateverUsernameYouDesire@localhost;
```
4. Exit the application and sign in with new user and connect to simple_cms_development database.
```
mysql -u whateverUsernameYouDesire -p simple_cms_development
```
