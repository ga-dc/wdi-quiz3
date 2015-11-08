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
def take_rose(person)
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

take_rose('young prince')

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
residents.delete(1)
guests << "Belle"

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
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]

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
An ERD is an entity relationship diagram, which provides a visual representation of relationships and associations between entities that will all be assigned their own table, but contained within the same database. Within each entity in the diagram, you can also document what attributes an entity may have (which will eventually become columns in the database table.) In the example above, you could use the relationship descriptors "has many" and "belongs to" to chart some of these relationships -
*Person has_many -> <- belongs_to Pets
Attributes:
  -name                            -name
  -age                             -age
  -profession                      -breed
*Lamp belongs_to -> Person
*Genie belongs_to -> <-belongs_to Lamp
Attributes:
 - name                          -color
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema provides a model for what information will be included in a new database, and how it will be organized. Within a schema file, you create a table for each entity, define which attributes that entity will have, and describe what data type will be provided for each attribute. Models within the schema can also show associations between tables. For example, each instance in my Apartment table "has_many" tenants, whereas each instance in my Tenant table "belongs_to" an apartment.
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
genie_lamp = Lamp.create(wishes_remaining: 3)
genie_lamp.wishes_remaining = 3
genie_lamp.save
jafar = Genie.create(name: "Jafar")
jafar_lamp = Lamp.create(wishes_remaining: 3)
genie_lamp.wishes_remaining = nil
genie_lamp.save
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
A RESTful route allows you to link and routes and methods that allow your web application to perform actions like get, put, post, delete, and patch on an HTTP url (as specified in the controller file).

The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors/'
  * This is the index route, which shows the full roster of warriors.

GET 'warriors/new'  
POST '/warriors/new'
  * These two routes will allow the Emperor to access a form to create a new warrior, and then the Post method will allow the Emperor to enter new warriors into the database and redirect him to the full index.

PUT 'warriors/:id'
  * This is an update route that will update the warriors information (based on input parameters provided) and then reroute to the warriors/:id view to show the updated information

DELETE 'warriors/:id'
  * This is a delete/destroy route which will allow the Emperor to retire or decommission a warrior.


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
