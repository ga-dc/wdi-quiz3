Assume you have an array of strings representing friend's names:

```ruby
friends = ["Chip Potts", "Cogsworth", "Lumière", "Mrs. Potts"]
```

Using `.each` AND string interpolation, produce output (using `puts`) like so:


Belle is friends with Chip Potts
'''
friends.each do |friend|
  puts "Belle is friends with friend"
end
friends.each {|friend| puts "Belle is friends with #{friend}"}
