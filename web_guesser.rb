require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = background(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    guess > SECRET_NUMBER + 5 ? "Way too high!" : "Too high!"
  elsif guess < SECRET_NUMBER
    guess < SECRET_NUMBER - 5 ? "Way too low!" : "Too low!"
  elsif guess == SECRET_NUMBER
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

def background(message)
  if message == "Way too high!" || message == "Way too low!"
    "red"
  elsif message == "Too high!"  || message == "Too low!"
    "lightcoral"
  elsif message == "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
    "green"
  end
end
