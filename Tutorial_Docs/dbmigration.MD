# Migrating Database
After you've gotten [mysql installed](https://github.com/kinseyost/ruby-tutorial#install-mysql), there might be a few gotchas depending on your setup.

Check the config/database.yml to get the appropriate `username`. You will also need to find the `password`,
which will be placed in the `IDENTIFIED BY ''` bit of sql below.

### Open mysql with root user
```
mysql -u root
```
Once in mysql, create a user of the appropriate name.

### Create appropriate user
```
CREATE_USER 'simple_cms'@'localhost';
```

### Grant all priveleges to said user.
```
GRANT ALL PRIVILEGES ON *.*
TO 'simple_cms'@'localhost';
IDENTIFIED BY '';
```

### Create the database
```
CREATE DATABASE simple_cms_development;
```

### Exit mysql
```
exit
```

## Migrate the db
```
rake db:migrate
```

### Problems
If you are seeing a problem such as
```
$ rake db:create --trace
rake aborted!
dlopen(/Users/username/.rvm/gems/ruby-1.9.3-p194@rails3tutorial2ndEd/gems/mysql2-0.3.11/lib/mysql2/mysql2.bundle, 9): Library not loaded: libmysqlclient.18.dylib
  Referenced from: /Users/username/.rvm/gems/ruby-1.9.3-p194@rails3tutorial2ndEd/gems/mysql2-0.3.11/lib/mysql2/mysql2.bundle
  Reason: image not found - /Users/username/.rvm/gems/ruby-1.9.3-p194@rails3tutorial2ndEd/gems/mysql2-0.3.11/lib/mysql2/mysql2.bundle
```

Try this
```
sudo ln -s /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/lib/libmysqlclient.18.dylib
```
And checkout [this](http://stackoverflow.com/questions/10557507/rails-mysql-on-osx-library-not-loaded-libmysqlclient-18-dylib) out for more information
