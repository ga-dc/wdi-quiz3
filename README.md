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
offerRose("young prince");
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
belle = town.residents[1];
town.castle.residents.push(belle);
town.residents.delete("Belle");
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
Entity Relationship Diagram. ERDs are a form of Domain Modeling that represents data entities - "the nouns" -  of the program.  ERDs visualize the data structure for major program entities, and map out the relationships between entities.

A Genie has a name, master, lamp, and wishes. A Genie has one Person (at a time). A Genie has one lamp. A Genie has three wishes to give (per Person).  A Genie is activated by a Person through the Person's Pet action.

One lamp might have multiple Genies (as per in 'I Dream of Genie' when the mother-in-law visits and they have private meetings in the lamp). Each lamp has one Person. When a Person Pets a Lamp, a Genie(s) is(are) activated.

A Person could possibly collect multiple Genies. A Person can collect multiple lamps. A Person can use up to three wishes per Genie.  To use the Genies' wishes, A Person must Pet a Lamp. A Person has a name, etc...

Continuing wit the I Dream of Genie references: A Person may enter a Lamp, and can only be released by the Genie of (this)Lamp.  Becoming trapped in the lamp may therefore necesitate use of one of the Person's three Wishes associated with (this)Lamp's Genie. If the Person does not have a wish remaining when they become trapped, they may be left there until another Person Pets the Lamp.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a set of ruby object definitions that outline the type of data that will be used for each attribute of a ruby object.  objects are tracked in the database by assigning them ids, defined as SERIAL PRIMARY KEY data that is auto-assigned by the SQL database.  Relationships between data is mapped in two ways. One, by assigning Foreign Key References (the id of a related object, to which the instance object belongs). Two, by models in which classes are assigned whether their instances "has_many" of another class-type or "belongs_to" an instance of another class.
```

### Question 6

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
<!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? --><!-- Probably a good idea, since I'm running with I Dream of Genie references -->
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
my_new_lamp = Lamp.create(wishes_remaining: 3);
my_new_genie = Genie.create(name: 'Genie');
my_new_genie.my_new_lamp;
genie = Genie.where(name: 'Genie');
genie.Lamp.update(wishes_remaining: 1);
jafar = Genie.create(name: "Jafar");
jafar.my_new_lamp;
genie.update(Lamp: nil);
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
Representational State Transfer (REST) is a convention used on the internet to make services and applications run in a way that reflects the functioning of the internet itself.  A RESTful route can be as simple as setting each resource or service of an application to a set and relatively semantic location/address. This location or address is the Uniform Resource Locator (URL). Using RESTful routes, we are able to easily remember and access online data and resources in a way that is intelligible to humans, and easy for developers. It is very useful for minimizing bureaucratic resource strain when dealing with large armies
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
  puts 'come out and play'
  Warrior.all
    *This is the index page that would list all of the warriors
  end

GET '/warriors/new'
  *Shows a form to create a new warrior.
end

POST '/warriors'
  *Creates a new warrior using input from the form in /warrior/new
end

GET '/warriors/:id/edit'
  *Shows a form to edit the elements of a particular warrior
end

PUT '/warriors/:id'
  *Edits the elements of a particular warrior based on input from the form
end

DELETE '/warriosr/:id'
  * Deletes a warrior by their id
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
<ul> <% @warriors.each do |warrior| %>
<%= puts "<li><a href='/warriors/#{warrior.id}'>#{warrior.name}</a></li>" %>
<% end %>
</ul>
```
