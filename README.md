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
Using cloud9 Follow [this guide](https://community.c9.io/t/setting-up-mysql/1718)
On Mac, I'm using [homebrew](http://brew.sh/)
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
Or in cloud9
```
rails s -b $IP -p $PORT -e c9
```

## Migrating Database
To get the same database as is in a certain project, follow the instructions [here](./Tutorial_Docs/dbmigration.MD).

## Navigating this tutorial
[Most of the commits](https://github.com/kinseyost/ruby-tutorial/commits/master) represent a lesson, to follow along go through each of the commits to see what the lesson entails.  Most of them are explained pretty well through the commit message.

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

## Database Initialization
Create a database in mysql
1. Login
```
mysql -u root
```
2. Create database
```
CREATE simple_cms_development;
```
3. Switch to new database
```
USE simple_cms_development;
```
4. Create a new user and password so you don't have to use *root* for everything.
```
CREATE USER 'whateverUsernameYouDesire'@'localhost';
```
Give permissions to user.
```
GRANT ALL PRIVILEGES ON simple_cms_development.*
TO 'whateverUsernameYouDesire'@'localhost'
IDENTIFIED BY 'whateverPasswordYouDesire';
```

To grant permissions to everything user
```
GRANT ALL PRIVILEGES ON *.*
TO 'whateverUsernameYouDesire'@'localhost'
IDENTIFIED BY 'whateverPasswordYouDesire';
```

You can now check the privileges of that user.
```
SHOW GRANTS FOR whateverUsernameYouDesire@localhost;
```
5. Exit the application and sign in with new user and connect to simple_cms_development database.
```
mysql -u whateverUsernameYouDesire -p simple_cms_development
```

## Creating db schema dump
This will create a schema dump file: 'db/schema.rb'
Even if you don't have any tables, this command can be used to ensure the database configuration in database.yml is correct.  If not, it will throw an error.
```
rake db:schema:dump
```

## Working with rake
Rake helps perform tasks by running scripts.
You can use it to perform many types of tasks by through rails, as well as add your own custom scripts by adding new ones to /Rakefile.
To see what kind commands are available in the root of your application types
```
rake -T
```
To drill down into rake db tasks,
```
rake -t db
```
You can also add an environmental variable to the rake command to specify certain conditions.
The most common one being `RAILS_ENV=production`
```
rake db:schema:dump RAILS_ENV=production'
```
or for cloud9,
```
rake db:schema:dump RAILS_ENV=c9'
```

## Migrations
Migrations are Ruby's way of interacting with the database schema using Ruby code.
### Generate Migrations
```
rails generate migration MyMigrationName
```
### Generate Model
Generating a model will also generate an associated migration.
In this case the associated migration would be named with the timestamp and then _create_model_names.rb
```
rails generate model ModelName
```

#### Running our migrations
*For any of the `rake` commands in cloud9, append `RAILS_ENV=c9`.*
Rake will create the tables we have specified in our migration files, and add entries for each of the migrations keyed by their timestamp.
```
rake db:migrate
```

View the migrations in the database under the schema_migrations table.
``` sql
SELECT * FROM schema_migrations;
```

#### Taking down migrations
This will take down all of your migrations.
```
rake db:migrate VERSION=0
```
#### Get the status of the migrations
To see if migrations are up or down
```
rake db:migrate:status
```

#### VERSIONs
You can go through the migrations sequentially by using VERSION=<timestamp> of whatever version.
So if you only wanted to run the Create users migration, you'd enter
```
rake db:migrate VERSION=20160917170621
```

## Rails Console
From the root of your application, you can perform tasks using your application
to models and the database through `rails console`
```
rails console
```
To specify enironment:
```
rails console c9
```
For more info, check out [Rails Console]('./Tutorial_Docs/Rails_Console.MD').
