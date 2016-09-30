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

### foreign_key
If your foreign key is something other than the associated class_name, you must specify a different foreign key
```
belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id" # because foreign key is not called editor_id

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


## Rich Many-to-many
Create new model for rich join table
```
rails generate model SectionEdit
```

Adding join between tables
```
edit = SectionEdit.new
```
```
edit.summary = "Edited some content"
```

```
me = AdminUser.find(1)
```

```
section = Section.find(1)
```

```
section.section_edits << edit
```

```
me.section_edits << edit
```

### Reloading from DB
Sometimes your, especially if you use `edit.section = section` emphasis on the `=` operator, the models in rails console might get out of sync.
You can tell rails console to refresh from the db by using
```
edit.editor(true)
```

## has_many :through
Whereas a HABTM association can access the association in the table that it is related to, 
a rich many-to-many association must use `has_many :through`.

In your model, add the join table that you want to go through 
to get the corresponding association.

``` rb
# admin_users.rb
  has_many :sections, :through => :section_edits
```
On both sides of the association
``` rb
# section.rb
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
```


