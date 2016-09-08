# Ruby on Rails Tutorial

This is a working tutorial for setting up your first Ruby App.

## Install latest version of ruby
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
gem install bunder
```

You probably don't need docs cause they're much better online.
```
gem install rails --no-ri --no-rdoc
```
