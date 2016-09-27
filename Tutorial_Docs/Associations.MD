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
