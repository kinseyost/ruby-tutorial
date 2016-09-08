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
