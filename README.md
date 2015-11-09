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
town[:residents] = ["Maurice", "Gaston"]
town[:castle][:guests] = "Belle"
town
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
An ERD (entity relationship diagram) shows how different entities are related to each other, if they are related, specifically in a belongs-to or has-many way. For example, a genie belongs to one lamp. A lamp has one genie. Genies cannot belong to multiple lamps and cannot have any lamps. Lamps cannot have more than one genie (probably)(I wouldn't know from experience though) and cannot belong to genies. A person can have multiple pets and pets can have multiple people (owners). Knowing these relationships is crucial to designing apps involving these entities.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema sets up the tables of a database by describing what data they will hold. They describe what the columns are (column names) and the datatype to expect from those columns (string, integer, etc.) To represent a one-to-many relationship in an SQL database, you include a foreign ID in the many that would correspond to the one. For example, in the case where one person may have many wishes, the wishes table could have a column called "person_id".
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

Lamp.update(wishes_remaining: 1)
jafar = Genie.create(name: "Jafar")
Lamp.create(wishes_remaining: 3, genie: jafar)
lamp.update(wishes_remaining: 1)

# This question is a little confusing.
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
A RESTful route is how browsers communicate with the server. The seven RESTful routes are:
1. index
2. show
3. new
4. create
5. edit
6. update
7. delete
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
  * This is the index route, which shows an index, or list, of all warriors

GET '/warriors/new'
  * This is the new route, which will allow you to make a new warrior

POST '/warriors/new'
  * This is the create route, which specifies what kind of new warrior you are creating

GET '/warriors/:id/edit'
  * This is the edit route, which lets you look at the warrior attributes to edit

PUT '/warriors/:id/edit'
  * This is the update route, which lets you set and save new warrior attributes

DELETE '/warriors/:id'
  * This is the delete route, which will remove a warrior from the ranks.
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
<h1>All Warriors</h1>

<ul>
  <% @warriors.each do |warrior| %>
  <li><%= warrior.name %></li>
  <% end $>
</ul>
```
