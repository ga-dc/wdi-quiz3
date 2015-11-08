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
def offer_rose person
  puts "Would you take this rose and help out an old beggar, #{person}?"
end

offer_rose "young prince"
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
town[:castle][:guests] << town[:residents].slice!(1)
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
friends.each {|friend| puts "Belle is friends with #{friend}"}
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
An ERD is an entity relationship diagram.  These diagrams are used to show the relationship between (and contents of) entities, which are generally classes.  These diagrams map out the relationships that will exist between two or more related classes and so help to demonstrate which methods will be required in order to represent the diagram inside code.

An example using genie, lamp, person, and pet might be:
-a lamp contains one genie, and each genie lives inside a single lamp
-a person owns many pets, but each pet has only one person
-a person may own many lamps, but each lamp has only one owner
-some lamps, people, pets, and genies have certain attributes which should be described inside each entity/class
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is a sql template.  Its components are a name and a list of attributes, including an id which is usually automatically assigned.  A sql schema can be thought of as similar to a class in ruby.

One to many relationships are represented in sql by sharing ids.  For example an apartment has many tenants, so inside the tenant schema we would include a key:value pair to represent the id of the apartment in which that tenant is staying.  The value of this key would correspond with the id of an apartment.
```

### Question 6

**Assume:**
1. Your database two working tables, `genies` and `lamps`.
2. You have a working connection to the database for ActiveRecord.
3. You have active record models defined for `Genie` and `Lamp`, and the
relationships between the two are set up in Active Record.
Write code to do the following:
<!-- Do we want to specifiy what kind of relationship they have, in case some students aren't familiar with the mythology...? -->
4. Lamps have one property, `wishes_remaining`, and genies have one property, `name`.


1. Create a lamp with 3 wishes remaining and a genie named 'Genie'
2. Create a relationship between 'Genie' and the lamp.
3. Update the lamp so it only has one wish left.
  * Oh no... Jafar has Aladdin! Thankfully he's wished to become a genie himself!
4. Create a new Genie named 'Jafar' and put him in a new lamp with 3 wishes left.
5. Free the good Genie by setting his lamp to `nil`


Write your code here:
```ruby
# assuming the lamp and genie templates are automatically assigning ids
genie = Genie.new(name: "Genie")
lamp = Lamp.new(wishes_remaining: 3, genie: genie.id)
lamp.update(wishes_remaining: 1)
jafar = Genie.new(name: "Jafar")
new_lamp = Lamp.new(wishes_remaining: 3, genie: jafar.id)
lamp.destroy
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful routes are one possible way to order the pages of a web app.  The routes will bring the user from one page to the next based on where he clicks or what he inputs.  

RESTful routes must refer to one of seven actions in order to simplify and organize your web app.  These actions are index, new, create, show, edit, update, and destroy.

Index would list all warriors.  New would show a form to create a new warrior.  Show would show the specific attributes of a warrior.  Edit would bring a user to a form to edit a warrior.  Update would trigger the actual editing.  And destroy would delete a warrior.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/new'
  * This is the new route, which will show a creation form.

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
  * This is the index route, which displays all the warriors.

GET '/warriors/:id/edit'
  * This is the edit route, which will show an editing form.

DELETE '/warriors/:id/'
  * This is the delete route, which will show a delete a specific.

PUT '/warriors/:id/edit'
  * This is the update route, which will update a specific warrior.

POST '/warriors/:id/edit'
  * This is the create route, which will create a new warrior.
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
<%@warriors.each do |warrior|%>
  <li><p><%=warrior.name%></p></li>
<%end%>
</ul>
```
