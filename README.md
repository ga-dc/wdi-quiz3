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
def offerRose (person)
  puts "Would you take this rose and help out an old begger, #{person}?"
end
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
belle=town[:residents].delete("Belle");
town[:castle][:guests]<<belle;
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
ERD is entity relationships diagram that is data modelling technique.
We need thse because we need to structure entity framework and data modelling.
Entities for the given example would be Person Lamp, and Pet.
Person would have Genie as an attribute. Person and Lamp, Pet has one to many relationship.
One person can have many pets and lamps.
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
Schema is a diagram where explains relationship between data entities.
Each people can have many wishes.
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
# lamp=Lamp.create(wishes_remaining: 3);
@ginie=Genie.create(name: "Genie");
@lamp=@genie.lamps.create(wishes_remaining: 3);
@lamp.update(wishes_remaining: 1);
@jafar=Genie.create(name: "Jafar");
@jafar.lamps.update(wishes_remaining: nil);
# class Genie <ActiveRecord::Base
#   has_many :lamps
# end
# class Lamp <ActiveRecord::Base
#   belongs_to :Genie
# end


```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful route is ways to coordinate communication between web browsers, web pages in the server.

```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id'
  * This is the show route, which finds a warrior by ID, and displays information about that warrior.


  1. To display list of soliders:
  GET-/soldiers-soldiers#index

  2. to return an HTML form to create a new soldier:
  GET-/soldiers/new-soldiers#new

  3. To create a new soldier:
  POST-/soldiers-soldiers#create

  4. To display a specific soldier:
  GET-/soldiers/:id-soldiers#show

  5. To return an HTML form for editing a soldier:
  GET-/soldiers/:id/edit-soldiers#editing

  6. To return an HTML form for editting a soldier:
  PATCH-/soldiers/:id-soldiers#update

  7. To delete a specific soldier:
  DELETE-/soldiers/:id-soldiers#destroy


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
<!doctype html>
<html>
<head>
</head>
<body>
<% @warriors.each do |warrior| <%>
    <li><%=warrior.name%></li>
<% end %>
</body>
</html>
```
