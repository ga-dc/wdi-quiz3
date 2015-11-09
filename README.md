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
def offer_rose(person)
  puts "Would you take this rose and help out an old beggar, #{person}"
end
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
town[:castle][:guests] = (town[:residents].slice!(1))
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
An ERD or Entity Relationship Diagram is a visual tool for describing how different things in a database relate to one another.

A Genie has one Lamp and a Lamp has one Genie - one-to-one

A Person has many pets (potentially) and a pet has many people (family memebers) - many -to-many
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a file that tells the database how data relates to one another.

A one person having many wishes can be represented by having a person_id attribute for each wish.
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
# 1. Create a lamp with 3 wishes remaining and a genie named 'Genie'

lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: 'Genie')

# 2. Create a relationship between 'Genie' and the lamp.

class Lamp < ActiveRecord::Base
  has_one: genie
end

class Genie < ActiveRecord::Base
  belongs_to: lamp
end

# 3. Update the lamp so it only has one wish left.

lamp.update(wishes_remaining: 1)

#   * Oh no... Jafar has Aladdin! Thankfully he's wished to become a genie himself!
# 4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left.

bad_lamp = Lamp.create(wishes_remaining: 3)
bad_lamp.Genie.create(name: 'Jafar') *********** NOT SURE SYNTAX ???? *********

# 5. Free the good Genie by setting his lamp to `nil`

genie.update(lamp_id: nil)
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful routes associate database, controller, and HTTP actions. CRUD -> (index, show, new, create, edit, update, delete) -> (GET, POST, PUT, DELETE)
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriours/new'
  * shows form for creating new warrior

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

POST '/warriors'
  * Creates warrior from /new form

GET '/warriors/:id/edit'
  * shows form for editing warrior

PUT '/warriors/:id'
  * updates warrior

DELETE '/warriors/:id'
  * deletes warrior
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
  <p><%= warrior.name %></p>
<% end %>
```
