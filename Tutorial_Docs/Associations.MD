# ActiveRecord Associations

## One-to-one
* has_one
* belongs_to

## One-to-many
* has_many
* belongs_to
In ruby console, you can use these methods for has_many
```
subject.pages
subject.pages << pages # append a pages
subject.pages = [page, page, page] # have to append them all if you want to add
subject.pages.delete(page)
subject.pages.destroy(page)
subject.pages.clear
subject.pages.empty?
subject.pages.size
```


## Many to Many
(When join table only has foreign keys)
* has_and_belongs_to_many (HABTM method)
* has_and_belongs_to_many


## Naming associations
### join_table
When working with Many to many, the name of the join table should be alphabetical, and plural.
If you don't name the table according to this standard, you can specify the `join_table` name like this.
```
has_and_belongs_to_many :admin_users, :join_table => "admin_users_pages"
```
Note, this has to be done in admin_users also.

### class_name
If you have a more applicable association name based on the association type, you can rename the association type by defining the association with that name and telling the model the `class_name`
```
has_and_belongs_to_many :editors, :class_name => "AdminUser"
```
You would then access the methods added to the model in rails console via
```
pages.editors
```

## Defining editors on pages
In rails console, create a new user
```
me = AdminUser.create(:first_name => "Kinsey", :last_name => "Van Ost", :username => "kinseyost")
```

Find the page you want to add a user to
```
page = Page.find(2)
```

Associate the new user to the page
```
page.editors << me
```
