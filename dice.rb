require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

#dice program:
get("/") do
  '<h1>Dice Roll</h1>
  <a href="/dice/2/6">Roll two 6-sided dice</a><br>
  <a href="/dice/2/10">Roll two 10-sided dice</a><br>
  <a href="/dice/2/8">Roll two 8-sided dice</a><br>
'
end
get("/zebra") do
  "We must add a route for each path we want to support"
end
get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end
get("/dice/2/8") do
  first_die = rand(1..8)
  second_die = rand(1..8)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d8</h1>
  <p1>#{outcome}</p1>"
end
