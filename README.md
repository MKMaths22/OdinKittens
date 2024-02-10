# README

This project follows the instructions for The Odin Project 'Kittens API', at https://www.theodinproject.com/lessons/ruby-on-rails-kittens-api

Uses Ruby version 3.1.2p20 and Rails 7.1.3. To set up the database, it is necessary to run rails db:seed so you start off with some kittens.
As an extra feature, I have made the cuteness and softness values be restricted to a list of three options in each case, which are defined as class methods in the Kitten model and referenced from the relevant view. I got this idea from konyak's answer on Stack Overflow: https://stackoverflow.com/questions/14113057/how-to-have-a-drop-down-select-field-in-a-rails-form

------------------

**Building a kittens API**

This is a fast and straightforward project where you’ll set up a Rails app to be a data-producing API… which is just a fancy way of saying that all your controller methods will render data instead of HTML. Consider this a drill in quickly building a pure vanilla RESTful resource. We won’t be working with an external API until the next project.

**HTML**  

We’ll start by building our Kitten application to work normally in the browser with HTML.  

1. Set up a new Rails application (odin-kittens) and Git repo.  
2. Update the README to describe the application and link back to this project.  
3. Build a Kitten model with attributes of :name, :age, :cuteness, and :softness.  
4. Build a KittensController and :kittens routes for all 7 RESTful actions.  
5. Set your default route to kittens#index.  
6. Fill out each of your controller actions and their corresponding views to display a very basic HTML page – #index should just list all Kittens, #show should display a single Kitten, #new should render a Kitten creation form, #edit should use the same form (which should be a partial used by both the New and Edit views) to Edit the Kitten, #create and #update should do their jobs.  
7. Make a delete link on the Kitten’s Show and Edit pages, as well as next to each Kitten listed in the Index page.  
8. Implement a display of the flash hash which congratulates you on adding or editing or deleting kittens and makes fun of you for errors in your form.  
9. Test out your Kitten creation machine to make sure all your controller actions are running properly.  

**JSON API**  

Now it’s time to make the Kittens resource available via API.  

1. Open a new command line tab and fire up IRB. We’ll use rest-client gem to send requests to our app:

require 'rest-client' # If you get an error here, you most likely need to install the gem.  
response = RestClient.get("http://localhost:3000/kittens")  

2. Let’s see what we got back:  

response.body #=> Should return a sloppy mess of HTML.  
alternatively, you can do this:
response.to_s  

If you check out your server output, it’s probably processing as */* (i.e. all media types), e.g. Processing by KittensController#index as */*

3. Try asking specifically for a JSON response by adding the option accept: :json, e.g.:  

json_response = RestClient.get("http://localhost:3000/kittens", accept: :json)  

You most likely will get a 406 Not Acceptable error - check your server console and you will see ActionController talking about UnknownFormat for your controller.  

4. Now modify your KittenController’s #index method to #respond_to JSON and render the proper variables.  

5. Test it out by making sure your RestClient calls return the proper JSON strings, e.g.:  

json_response = RestClient.get("http://localhost:3000/kittens", accept: :json)  
puts json_response.body  

6. Do the same for your #show method, which will require you to provide an ID when making your request. Your CSRF protection will prevent you from creating, updating or deleting kittens via the API, so it’s not necessary to implement those.  

Now you’ve got a website that is both a normal HTML-producing back end AND an API that can be used to pull data from it. You could use JavaScript calls from the front end to dynamically refresh your data now or even to load the whole page in the first place. Or maybe you’ll be hooking up a Kittens app to your iPhone and need a back end. It doesn’t matter, since now you’ve got a RESTful API.

---------------------  