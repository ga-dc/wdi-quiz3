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
def offerRose (person)
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

offerRose "young prince"
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
town[:castle][:guests] << town[:residents].delete_at(1)
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
    puts "Belle is friends with #{friend}."
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
An ERD is an entity-relationship diagram is a chart that shows the relationship between database entities. They are important in designing and structuring database information. A genie and lamp have a one-to-one relationship because a genie only has one lamp and a lamp belong to only one genie. Some attributes for the genie might be name, age, abilities. Some attributes for the lamp might be color, material, and size. A person and a pet is a many-to-many relationship. A person may have many pets and a pet may have many owners. Some attributes for a person are name, age, sex. Some attributes for a pet might be type of animal, age, fur length.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a logical structure and grouping of information in a database and usually represented as objects and/or tables. For people and wishes, we would say that a person has many wishes and that the wishes belong to one person.
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
Lamp.create(wishes_remaining: 3)

Genie.create(name: "Genie")

class Genie < ActiveRecord::Base
  has_one :lamp
end

class Lamp < ActiveRecord::Base
  belongs_to :genie
end

no_one_lamp = Lamp.create(id: 1, wishes_left: 3, genie_id: 1)

no_one_lamp.update(wishes_left: 1)

jafar_genie = Genie.create(id: 2, name: "Jafar")

jafar_lamp = Lamp.create(id: 2, wishes_left:3, genie_id: 2)

jafar_lamp.update(genie_id: nil)
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful routes in Rails are the most common requests and made up of a method and a path.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET "/warriors"
  * Index route - shows all warriors

GET "/warriors/new"
  * New route - takes you to form to create   a new warrior

POST "/warriors"
  * Create route - makes the new warrior

GET "/warriors/:id/edit"
  * Edit route- takes you to form to edit a warrior

PUT "/warriors"
  * Update route- updates a specific warrior

DELETE "/warriors"
  * Delete route - Deletes warrior
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
<%= warrior.name %>
<% end %>
```
