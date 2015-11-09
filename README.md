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
def offerRose person
  puts "Would you take this rose and help out an old begger, #{person}"
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
town[:residents].delete_at(1)
town[:castle][:residents] = [town[:castle][:residents]]
town[:castle][:residents].push("Belle")
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
An ERD is an entity relationship diagram, and it depicts the relationships between different database entities. These relationships can be one-to-many, many-to-many, or one-to-one, dependng on whether one or both 'members' of a relationship can theoretically have more than one of the other 'member' in a relationship. This information helps us plan out the table structure of the databases we'll get data from, and keeps the data separate from the behavior that we'll program later on.

A genie can only be in one lamp, and one lamp (presumably ...) can only house one genie, so their relationship is one-to-one. A pet can belong to multiple people, and a person can have multiple pets, so that's a many-to-many relationship. A person can technically, if they're very lucky, have multiple genies. Assuming a genie is only beholden to one person at a time, the person-to-genie relationship would be one-to-many. 

Without any markings specifying the 'one' or 'many' ends, a diagram might look like this:

Person
|   \   Lamp
|    \   /
|     \ /
Pet  Genie 

```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema converts an ERB into an actual database, and defines how data from one table can grab data from another one. In the models folder, you would need to include code like the following:

class Person < ActiveRecord::Base
  has_many :wishes
end   

class Wish < ActiveRecord::Base
  has_one :person
end

Every Wish item would have to include an owner_id or wisher_id, which identifies the one person that it belongs to. If you save a particular person to a variable, e.g. Aladdin, you could then see a list of all his wishes with Aladdin.wishes.

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
genies_lamp = Lamp.create(wishes_remaining: 3)
genie = Genie.create(name: 'Genie')
genies_lamp.update(genie_id: genie.id)
genie.update(wishes_remaining: 1)
jafar = Genie.crate(name: 'Jafar')
jafars_lamp = Lamp.create(wishes_remaining: 3)
jafars_lamp.update(genie_id: jafar.id)
genies_lamp.update(genie_id: nil)

```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
REST stands for REpresentative State Transfer, and it standardizes communication between browsers and servers. It allows you perform the CRUD (create, read, update, destroy) actions on your data.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
  * index of all warriors

GET '/warriors/new'
  * brings you to a form to create a new warrior

POST '/warriors'
  * takes the data from the form and creates a new warrior

GET '/warriors/:id/edit'
  * brings you to a form to edit an existing warrior

PUT '/warriors/:id'
  * takes the data from the form and updates that warrior's information

DELETE '/warriors/:id'
  * deletes a fallen warrior
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
<p>Here are all your warriors. Click on one for more information</p>

<% @all_apt.each do |apt| %>
  <p><a href="/warriors/<%= warrior.id %>"><%= warrior.name %></a></p>
<% end %>
```
