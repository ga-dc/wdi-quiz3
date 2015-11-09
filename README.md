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
belle = town[:residents][1]
town[:residents].delete(belle)
town[:castle][:guests]<< belle
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
An ERD is an Entity Relationship Diagram is a graphical representation of data, describing various entities, attributes, and the relationships between them. An ERD is used to model a database and allows us to better understand the scope of our problem and what we are trying to solve in creating an application.

For the above examples, the following relationships might exist:

Gene -> Lamp: one to one
Gene -> Person: one-to-many
Person -> Pet might be many-to-many or one-to-many

Gene Attributes:
name, age, past_masters, wishes, lamp_id(FOREGIN KEY)

Lamp Attributes:
location, date_lamp_last_rubbed, gene_id(FOREGIN KEY), current_master_id(FOREGIN KEY)

Person Attributes:
name, age, address

Pet Attributes:
name, type, age, owner_id(FOREGIN KEY)

```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a blueprint for how our database will be structured, defining tables associated with objects, and their columns including the name, data type, and any associated constraints.

For example, we can represent the following one-to-many relationship by creating two tables in a schema file and listing their associated columns.

CREATE TABLE people(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INTEGER,
);

CREATE TABLE wishes(
  id SERIAL PRIMARY KEY,
  wish_action TEXT,
  wish_date TEXT,
  people_id INTEGER
);
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
1.
  aladdins_lamp = Lamp.create(wishes_remaining: 3)
  genie1 = Genie.create(name: "Genie1")
2.
  genie :  has_one :lamp
  lamp :   belongs_to :genie
3.
  aladdins_lamp.update(wishes_remaining: 1)
  or
  aladdins_lamp.wishes_remaining = 1
  aladdins_lamp.save

4. jafar = Genie.create(name: "Jafar")
   new_lamp = Lamp.create(wishes_remaining: 3)
   jafar.genie_owner = new_lamp
   jafar.save
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
REST is a convention that developers follow to break up a request by the path and method. RESTful route is the method(action) and path(url) sent when a user makes a request, it models the database CRUD(create, read, update, delete) actions
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors'

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors/edit'
  *This is a edit route

PUT '/warriors'
  This is an update/edit route

GET '/warriors/new'
  This is a new route

POST '/warriors'

DELETE '/warriors/:id'

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
<h1>Warriors:</h1>
<% @warriors.each do |warrior|%>
  <h2><%=warrior.name%></h2>
<%end%>
```
