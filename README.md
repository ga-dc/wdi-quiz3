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
  puts "Would you take this rose and help out an old beggar, #{person} ?"
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

 town[:residents].remove("Belle")
 town[:castle][:guests].add



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
ERD stands for Entity Relationship Diagram. ERD's exist to show relationships between entities and attributes within a system or application. We use them as a tool to understand how our data is interacting within the program.

Disclaimer: I've never seen Aladdin so I am not  sure about the relationships between the four examples, but here's a shot.

Genie [attributes: nationality, age, gender, etc.]
  [relationships: lamp - one to one, person - one to many]
Lamp [attributes: color, size, brand]
  [relationships: genies: one to one, person: one to one ]
Person [attributes: age, gender, nationality, etc.]
  [relationships: genie - one to one, lamp: many to one]
Pets [attributes: breed, age, name]
  [relationships: genies - one to one, person: one to one]

```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
In programming, we use tables to store data we want to use in a program. Each table has a schema which defines the categories of the columns and rows and also defines the rules for the table (which input is allow, max word count, etc.)
```

### Question 6

**Assume:**
1. Your database *has* two working tables, `genies` and `lamps`.
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
1) lamp = Lamp.create(wishes_remaining: 3)
2)?
3) lamp.updates(wishes_remaining: 1)
4 jafar = Genie.create(name: "Jafar")
  lamp2 = Lamp.create(wishes_remaining: 3)
  
5)lamp = nil
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
A RESTful route is the way a user makes requests and interacts with the database performing CRUD (create, remove, update deleted) actions in real time in an application.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.

GET '/warriors'
*index route which lists all warriors

POST '/warriors'
*new route which allows user input to create a new warrior

GET 'warriors/:id/edit'
*allows user to change information (as defined in schema) for a particular warrior by id number

PUT 'warriors/:id/edit'
*update route which actually updates a specific warrior > kind of goes along with ^^

DELETE 'warriors/:id'
*destroy route which removed warrior (based on ID) from database

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
<h1>Warriors!</h1>
<%@warriors.each do |warrior| %>
  <h2><%=warrior.name%></%=warrior.name%></h2>
<%end%>
```
