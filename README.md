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
def offer_rose(person)
 puts "Would you take this rose and help out an old beggar, #{person}?"
end

offer_rose("young prince")
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
town[:residents].delete("Belle")
town[:castle][:guests].push("Belle")
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
An entity-relationship model describes information in a relationsal database as it relates to other information referenced in that database. The entities listed in this example include Genie, Lamp, Person, and Pet.

Attributes: 
Genie: id, name, color, length_of_servitude, lamp_id
Lamp: id, color, num_of_wishes, genie_id
Person: id, name, caste, pet_id, lamp_id
Pet: id, name, type, person_id

Examples of Relationships
Genie to Lamp : 1 to 1
Person to Lamp : many to 1
Person to Pet : one to many, although could also be many to many (I never saw the sequels so not sure how Abu and Rajah feel about Jasmine and Aladdin respectively.)
```

### Question 5

Describe what a schema is, and how we represent a one-to-many relationship in a
SQL database. If you need an example, you can use: people and wishes
(one-to-many).

Your answer:
```
A schema is used to create the seperate tables within a database. One to many relationships are represented in a database with the presence of a foreign key in a table. 

Note that (foreign key) is used to represent a value that would be a foreign key.

CREATE TABLE people (
id SERIAL PRIMARY KEY,
name TEXT,
caste INTEGER,
sqft INTEGER,
pet_id INTEGER (foreign key),
lamp_id INTEGER
);

CREATE TABLE wishes (
id SERIAL PRIMARY KEY,
wish_statement TEXT,
wish_status TEXT,
person_id INTEGER,
lamp_id INTEGER
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
Lamp.create(wishes_remaining: 3)
Genie.create(name: "Genie")

(assuming tables generated through migration)
def change
    add_column :genie_id, :integer
end

good_genie = Genie.find(1)
good_lamp = Lamp.find(1)
good_lamp.update(genie_id: good_genie)
goodlamp.update(wishes_remaining: 1)
jafar_genie = Genie.create(name: Jafar)
jafar_lamp = Lamp.create(wishes_remaining: 3, genie_id: jafar_genie)
good_lamp.id = nil
```

## Sinatra / REST (meets Mulan)

### Question 7

The Chinese Emperor needs an application to help him manage his warriors.
<!-- LOLZ. YES. -->

Describe to him what a RESTful route is, and list what the seven RESTful routes
would look like for such an application.

Your description:
```
RESTful route is what we get when we combine the VERB and the path to form a route.
```
Your routes:
```
The ancestors have provided an example of one route; you do the other six!

GET '/warriors/:id' do
    @warriors = Warrior.all
    erb :"warriors/index"
end

get '.warriors/new' do
    erb :"warriors/new"
erb

POST '/warriors' do
    @warrior = Warrior.create(params[:warrior])
    redirect("/warriors")
end

put "/warriors/:id" do
    @warrior = Warrior.find(params[:id])
    @warrior.update(params[:warrior])
    redirect("/warriors/#{@warrior.id}")
end

PATCH '/warriors/:id' do 
    @warrior = Warrior.create(params[:warrior])
    redirect("/warriors")
end

delete "/warriors/:id" do
    @warrior = Warrior.find(params[:id])
    @warrior.destroy
    redirect to("/warriors")
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
<ul>
  <% @warriors.each do |artist| %>
    <li>
      <a href="/warriors/<%= warrior.id %>"><%= warrior.name %></a>
    </li>
  <% end %>
</ul>
```
