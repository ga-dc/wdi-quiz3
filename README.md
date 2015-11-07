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
  puts "Would you take this rose and help out an old beggar, " + person + "?"
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
town[:castle][:guests].push(belle)
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
An ERD is an Entity Relationship Diagram. It is a way to model data (as entities), its attributes and any relationships that exist between different entities. We create them for applications to think conceptually about the problem the application is trying to solve and show how our data will interact with the program and with other data.

Example:
Genie
Attributes: age, abilities, aliases...
Relationships: {One-to-One: Lamp} {One-to-Many: Person}

Lamp
Attributes: color, shape/model...
Relationships: {One-to-One: Genie}

Person
Attributes: age, abilities, aliases, address...
Relationships: {One-to-Many: Genie} {Many-to-Many: Pet} (assuming a person may have more than one pet at a time...or in their lifetime. And also assuming more than one person can "own" a pet at a time.)

Pet
Attributes: age, abilities, type/species, favorite food...
Relationships: {Many-to-Many: Person}
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema describes the structure (column names, data type {string (text/varchar), integer, boolean}, any constraints) of a table in a database. It both instructs the database on what information to store and where, and informs the users/programmers what type of data they can expect in a table.

We represent relationships between data in a database using foreign keys. For example, in the one-to-many examples of people and wishes, wishes would have a foreign key named person_id or similar. Then, queries could be run collecting all the wishes belonging to a certain person.

SELECT * FROM wishes where person_id = 2;
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
genie = Genie.create(name: "Genie")
lamp = Lamp.create(wishes_remaining: 3, genie: genie)
lamp.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
jafar_lamp = Lamp.create(wishes_remaining: 3, genie: jafar)
lamp.update(wishes_remaining: nil)

```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful routes are the ways a client can make HTTP requests (like GET, POST, DELETE, PUT...) to a server and interact with the database, performing basic CRUD actions in an application.
```
Your routes:
```
(index)
GET '/warriors'

(new warrior form page)
GET '/warriors/new'

(show one warrior)
GET '/warriors/:id'

(submit new warrior form / create new warrior in db)
POST '/warriors'

(edit warrior form page)
GET '/warriors/:id/edit'

(submit edit warrior form / edit warrior in db)
PUT '/warriors/:id'

(destroy warrior from db)
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
<h1>Warriors</h1>

<ul>
  <% @warriors.each do |warrior| %>
  <li><%= warrior.name %></li>
  <% end %>
</ul>
```
