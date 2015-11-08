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
  puts "Would you take this rose and help out an old beggar, #{person}"
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
resident = town[:residents].slice!(1)
town[:castle][:residents] << resident
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
an ERD is an Entity Relationship Diagram. It is used to visually represent the relationship between objects. We can then use it to plan how we will code or communicate the intentions of our code, visually.
A genie will belong to a lamp. A lamp will belong to a Person and have one genie. A person will have 0 or many lamps and 0 or many pets. A pet will belong to a person. Eachw will have attributes like name,
type, age, # of wishes and even mathods like rub or pet.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a file that contains the objects of a database. We represent a one-to-many relationship within the class of the objects in volved using  "belongs_to" has "has_many"
```

### Question 6

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
4. Lamps have one property, `wishes_remaining`, and genies have one property, `name`.

Write code to do the following:

1. Create a lamp with 3 wishes remaining and a genie named 'Genie'
2. Create a relationship between 'Genie' and the lamp.
3. Update the lamp so it only has one wish left.
  * Oh no... Jafar has Aladdin! Thankfully he's wished to become a genie himself!
4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left.
5. Free the good Genie by setting his lamp to `nil`

DG: this one confused my a bit, please feel free to offer feedback on it if I'm wrong.

Write your code here:
```ruby
lamp = Lamp.new(wishes_remaining: 3)
genie = Genie.new(name: "Genie")
genie.update(lamp_id: lamp.id )
lamp.update(wishes_remaing: 1)

jafar = Genie.new(name: "Jafar")
new_lamp = Lamp.new(wishes_remaining: 3)

jafar.update(lamp_id = new_lamp.id)

genie.lamp_id=""

```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful is a use of convention over configuration that allows us to communicate the intention of the route through html verb. It makes our code readable and modular. It also is a separation of concerns mechanic.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/new'
  * this is the new route, which provides a form for the creation of a new warrior

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
  * this is an index route to list all available warriors

GET '/warriors/:id/edit'
  * this is an edit route that provides a form to update an warrior

PUT/PATCH 'warriors/:id/'
  * this is an update route that edits information in a record we already have

POST '/warriors'
  * this is the create route, sends a POST method to add the new warrior to the table

DELETE '/warriors/:id'
  * this is a destroy route, removes the warrior from our list of warriors


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
<p> <%= warrior.name %> </p>
<% end %>
```
