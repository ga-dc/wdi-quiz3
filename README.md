# Quiz #3

## Instructions

1. Fork this repo
2. Clone your fork
3. Fill in your answers by writing in the appropriate area, or placing an 'x' in
the square brackets (for multiple-choice questions).
4. Add/Commit/Push your changes to Github.
5. Open a pull request.

**Note**: only place your answer between backticks. Don't modify the backticks,
or the language specifier after them.

## Ruby Basics & Enumerables (meets Beauty and the Beast)


### Question 1

Define a method called `offerRose`, which should take one argument named person.

When called, the method should `puts`, "Would you take this rose and help out
an old beggar, X?", where X is the person passed into the method.

Demonstrate calling the method with an argument of "young prince".

Write your code here:
```ruby
def offerRose(person)
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

puts offerRose("young prince")
# code here
```

### Question 2

Assume the following hash:

```ruby
town = {
  residents: ["Maurice", "Belle", "Gaston"],
  castle: {
    num_rooms: 47,
    residents: "Robby Benson",
    guests: []
  }
}
```

Using Ruby, remove Belle from the town residents, and
add her to the list of guests in the castle.

Write your code here:
```ruby
resi = town[:residents]
  #resi = ["Maurice", "Belle", "Gaston"]

belle = resi.delete_at(1)
  #belle = "Belle"
  #resi = ["Maurice", "Gaston"]

  #lost from here on...
# code here
```

### Question 3

Assume you have an array of strings representing friend's names:

```ruby
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
```

Using `.each` AND string interpolation, produce output (using `puts`) like so:

```
Belle is friends with Chip Potts
Belle is friends with Cogsworth
Belle is friends with Lumière
Belle is friends with Mrs. Potts
```

Write your code here:
```ruby
friends.each do |friend|
  puts "Belle is friends with #{friend}"
end
```

## SQL, Databases, and ActiveRecord (meets Aladdin)

### Question 4

Describe what an ERD is, and why we create them for applications. Also give an
example what the attributes and relationships might be for the following
entities (no need to draw an ERD):
<!-- Maybe clarify whether they're meant to give relationships between all four entities or... -->
* Genie
* Lamp
* Person
* Pet

Your answer:
```
An ERD is a tool used to visualize and describe the date relating to the major entities that exist in a program.

A genie and a lamp have a one-to-one relationship, because there can only be one genie to a lamp and a lamp can only have one genie.
 - Genie
    - name #string
    - confined_to_lamp #date
    - location #string
 - Lamp
    - last_rubbed #date
    - location #string
    - model #string
    - last_master #string

A person and a pet is a one-to-many relationship, because a person can have many pets, but a pet can only have one person.
 - Person
    - name #string
    - birthdate #date
    - age #integer
    - sex #string
 - Pet
    - name #string
    - birthdate #date
    - age #integer
    - fave_food #string

```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a blueprint of a database. It defines how data in a database is constructed.


```

### Question 6

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
4. Lamps have one property, `wishes_remaining`, and genies have one property, `name`.

Write code to do the following:

1. Create a lamp with 3 wishes remaining and a genie named 'Genie'
2. Create a relationship between 'Genie' and the lamp.
3. Update the lamp so it only has one wish left.
  * Oh no... Jafar has Aladdin! Thankfully he's wished to become a genie himself!
4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left.
5. Free the good Genie by setting his lamp to `nil`


Write your code here:
```ruby
1. lamp = Lamp.create(wishes_remaining: 3)
   genie = Genie.create(name: "Genie")

2. class Lamp < ActiveRecord::Base
    has_many :genies
   end

   class Genie < ActiveRecord::Base
     belongs_to :lamp
   end

3. lamp.update(wishes_remaining: 1)

4. evil_lamp = Lamp.create(wishes_remaining: 3)
   Genie.create(name: "Jafar", lamp: evil_lamp)

5.
# code here
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
REST is a convention of the methods used to communicate between browsers and servers. A RESTful route is the method + the path.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
  * This route will show the emperor information about all his warriors.

POST '/warriors'
  * This route allows the emperor to add a new warrior to the Royal Military.

PUT '/warriors/1'
  * This route allows the emperor to update the warrior with id of 1 with all new content.

PATCH '/warriors/1'
  * This route allows the emperor to update the warrior with id of 1 with partially new content.

DELETE '/warriors/1'
  * This route allow the emperor to delete the warrior with id of 1.
```

### Question 8

Assume:
* Warrior is an ActiveRecord model, with a 'name' attribute.
* You have a Sinatra `app.rb` (or similar file), that defines the following
route:

```ruby
get '/warriors' do
  @warriors = Warrior.all
  erb :"warriors/index"
end
```

Write what an example ERB file (aka view) might look like to list all the warriors:

Write your code here (**NOTE: syntax highlighting doesn't work for ERB in markdown files, so ignore the colors!**):
```html
<% @warriors.each do |warrior| %>
  <p><%= warrior %></p>
<% end %>

```
