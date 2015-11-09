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
# code here
def offerRose person
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

offerRose("young prince")
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
# code here
town[:castle][:guests] << town[:residents].delete("Belle")
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
# code here
friends.each do |friend|
  p "Belle is friends with #{friend}"
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
ERD stands for Entity Relational Diagram.  It is a visual scheme that allows a designer to show the attributes of containing entities and the relationships between said entities.

A person can have one-to-many lamps but can only have one genie (Lore dictates monogamy between a master and a single genie).  A lamp can only have a single (one-to-one) genie.  Pets can belong to many (one-to-many) persons.

Pets and Genies -- and Pets and Lamps will/do not have a relationship as pets will not be able to mark lamps as their territories.

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
schema.sql exists in the db folder of a typical MVC layout which describes the has_many or belongs_to relationships of the classes placed in models.

class Person < ActiveRecord::Base
  has_many :wishes # wishs?
end

class Wish < ActiveRecord::Base
  belongs_to :person
end



### Question 6

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? -->

class Genie < ActiveRecord::Base
  belongs_to :lamp
end
class Lamp < ActiveRecord::Base
  belongs_to :genie
end


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
# code here
lamp_one = Lamp.create(wishes_remaining: 3)
genie_one = Genie.create(name: "Genie")
lamp_one.update(genie_id: genie_one.id)
lamp_one(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
jafar.lamps.create(wishes_remaining: 3)
genie_one.update(genie_id: nil)
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
A restful route is a combination of an HTTP VERB (e.g. GET, POST, PUT, DELETE) and a URL path. It's a very clean and dry way of setting up a website's different URL endpoints and allows for efficient CRUDing - ways for us to create, read (or view), update, and delete resources.

Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

Replace this with your answer
```
  DELETE '/warriors/:id'
  * This is the delete route which finds a warrior by ID, and deletes him from the database.

  GET '/warriors/:id/edit'
  * This is the edit route which finds a warrior by ID and displays a form to update his attributes.

  PUT '/warriors/:id'
  * This is the route that updates a warrior after the updated form has been submitted.

  GET '/warriors'
  * This is the index route, which shows all the warriors.

  GET'/warriors/new'
  * This is the route to display a form that will allow us to create a new warrior.

  POST '/warriors/'
  * This is the route that gets submitted after a user fills out the form for a new warrior and hits submit.

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
<!-- code here -->
<h1>Warriors</h1>
<% @warriors.each do |warrior| %>
  <h2><p><%= warrior.name %></p></h2>
<% end %>
```
