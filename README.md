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
town[:castle][:guests] += [town[:residents].slice!(1)]
# I think there's a better way to do this instead of using the index number, but
# can't for the life of me remember.
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
ERD stands for Entity Relationship Diagram, which is meant to map out the
relationships between different entities.  This is important in modeling how
information about these entities can be implemented in a database.

For the examples listed: a Genie might have attributes: color, age, morality;
and have a one-to-one relationship with a Lamp (a Genie *belongs* to a Lamp).
The Lamp itself might also have attributes that describe it as well (material,
place of origin, etc.) as well as relationships to other entities.

Similarly, a Person might have several self-descriptive attributes: age, gender,
height, etc.; and be related to several pets in a one-to-many relationship (a
Person might *have* many Pets, wheras a Pet generally has one owner). Pets, of
course, could have attributes: type-of-animal, age, gender, color, etc.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is essentially a blueprint for constructing a row entry in an SQL
database. Within the schema, one would assign the many (wishes) to the one (people)
by giving the wish-row a column for the person's ID.
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
# code here
lamp = Lamp.create(wishes_remaining: 3)
Genie = Lamp.genie.create(name: "Genie")
lamp.update(wishes_remaining: 1)

Jafar = Genie.create(name: "Jafar")
Jafar.lamp.create(wishes_remaining: 3)

Genie.update(lamp_id: nil)

```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
convention
REST is a for how information should be communicated between a browser and a server.
Seven RESTful routes: INDEX, SHOW, NEW, CREATE, EDIT, UPDATE, DELETE.
```
Your routes:
```ruby
# The ancestors have provided an example of one route; you do the other six!

get '/warriors/:id' do #show
  @warrior = Warrior.find_by(id: params[:id])
  erb :"warriors/:id"
end

get '/warriors' do #index
  @warriors = Warrior.all
  erb :"warriors/index"

get '/warriors/new' do #new
  erb :"warriors/new"
end

post 'warriors/new' do #create
  Warrior.create![params[:warrior]]
  redirect :"warriors/index"
end

destroy 'warriors/:id' do #destroy
  Warrior.find_by(id: params[:id]).destroy!
end

put 'warriors/:id' #edit
  @warrior = Warrior.update(params[:warrior])
end

patch 'warriors/:id' #update
  @warrior = Warrior.update(params[:warrior])
end

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
  <p><a href="/warrior/<%=warrior.id%>"><%= warrior.name %></a></p>
<% end %>

```
