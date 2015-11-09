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
# define offerRose method, which takes a name and puts a sentence
def offerRose (person)
  puts "Would you take this rose and help out an old beggar, #{person}?"
end
# call offerRose method
offerRose("Young Prince")
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
# remove Belle from the town residents
belle = town[:residents].slice!(town[:residents].index("Belle"))
# add her to the list of guests in the castle.
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
# Using `.each` AND string interpolation,
# produce output (using `puts`) based on "friends" array:
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
An ERD (Entity Relationship Diagram) is a visual representation of the way separate entities within a database relate. The ERD can map many important pieces of information, including -
1) Which data relates to other data (for example above, the relationship lines will likely form between Genies, and Lamps, and probably Lamps, and Perons[people], BUT there will be no lines between Genies and Pets, because there is no relationship between the two entities)
2) What type of relationship the connected entities have. One-to-many, in the case of one Genie/Lamp having many persons throughout their lifecycle, and each person belonging to only one Genie/Lamp. Or many-to-many, in the case of many persons (say in a family of five) having many pets, while also belonging to many pets (say the family has three dogs, four cats, and a rat) which have many owners.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema creates the structure of an SQL database. A schema can create, clear, and modify tables. Generally a schema is used to create the needed tables (in this case people and wishes). Additionally, the schema can determine what types of field values (also known as columns) should be included in a table. A one-to-man relationship in an SQL database allows a column in the 'many' table, to contain values which relate to the 'primary-key' of the 'one' table. In this case, that primary-key, since it is in a non-native table, is referred to as a foreign-key.
For the people/wishes database, the wishes table would have a column that indicates a value related (through primary-keys on the people table) to a unique person. Through this, a whole variety of functionality can be built in. The link can be used to show how many, if any, wishes a person has made, and what those wishes are. It can be used to show which individual people made the same wish. It can also be used to indicate that a person has reached their maximum number of wishes.
```

### Question 6

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specify what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
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
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
Replace this with your answer
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

Replace this with your answer
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
<!-- code here -->
```
