# Rails Console
Create new records in the db, and play with models using irb.

## Start Rails Console
From root of application
```
rails console
```
You may need to specify the environment (this will select the database you are working with)
```
rails c c9
```

## Creating Records
```
subject = Subject.new
```

To see if the subject is already saved in db
```
subject.new_record?
```

You can also create a new record with values filled in during creation
```
subject = Subject.new(:name => "Subject 1", :position => 1, :visible => true)
```

To save the record,
```
subject.save
```

You can also add logic to the rails console
```
if subject.save
    puts "Saved"
else
    puts "Not Saved"
end
```

### Create()
```
subject = Subject.create(:name => "Subject 2", :position => 2)
```

## Updating Records
Find subject by id
```
subject = Subject.find(1)
```
You can then update the fields either with `mass assignment`
```
subject.name = "New Name"
```
Or
```
subject.update_attributes(:name => "New Name")
```

## Deleting Records
Find and assign
```
subject = Subject.find(3)
```
destroy
```
subject.destory
```

## Finding Records
### Dynamic finder
This will not throw an error, rather it will return nil
All of the columns will automatically have a find by function added.
```
Subject.find_by_id(2)
Subject.find_by_name("Whatever you want to find")
Subject.find_by_visible(true)
```

### Find all
```
Subject.all
```
### Find First/Last
```
Subject.first
Subject.last
```

## Ruby in rails console
```
subjects = Subject.all
subject.each do |subject|
  puts subject.name
end
```

## to_sql
If you have retrieved a record, you can always check what that record represents by using `to_sql`
```
subject = Subject.find(3)
subject.to_sql
```

## Query Methods (conditions)
Where conditions
```
Subject.where(:visible => true)
```

```
Subject.where(:visible => true).order("position ASC")
```

Condition types to be included in where()
`where` method
1. Hash as seen above ... `Subject.where(:visible => true)`
 - Does not support OR, LIKE, < or >
 - Only supports equality, range, and subset checking
2. Strings (Unsafe for variables)
3. Array (rails can render out any SQL injection before executing, rendering them harmless).
 - `Subject.where(["name = ? visible = true", "First Subject"])`
 - "`First Subject` replaces `?`"

This method is stringable, so you can have multiple `where` methods added to a query...
```
Subject.where(:name => "kinsey").where(["name = ?"], "kinsey").first
```

### ORDER
You can order by any column; alphabetically, chronologically, ascending
* Should specify` table_name` and `column_name`
* ASC
* DESC
* Sort by multiple columns
  - `order("subjects.visible DESC, subject.name ASC")`

### LIMIT
Limits results returned

### OFFSET
Where to start when limiting results

```
subject = Subject.where(:visible => true).order("subjects.position ASC").limit(20).offset(40)
```

## Using named scopes in Rails Console
You can declare named scopes in you [model]('../app/models/subject.rb'), and then run them in the rails console.
* You must restart rails console after added a named scope.

### Usage:
In rails console
```
Subject.visible
```

```
Subject.search("Third")
```
