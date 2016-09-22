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