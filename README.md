**Artemis Papanikolaou | Karla Gardiner | Kate Haffenden | George Swarbrick | James Oddy | Kuba Jawor** <br>
<br>
as:
# The Boolean Autocrats # 
<br>

### proudly present: ###
<div style="text-align:center"><img src="public/Logo.png"/></div>
<br>

## About the project ##

***MakersBnB was created solely through remote pairing, co-ordination and teamwork.***

MakersBnB is a work in progress to simulate the same programming used in common AirBnB websites. Please be kind :)
<br>

### Main features ###

* Users can register and log in with an encrypted password. 
* They are able to see a list of the available spaces to rent or offer their own spaces for rent.
* They are able to request a booking for their chosen space and time.
* They can see a confirmation if their request has been accepted or declined.

## Technologies used ##

* Ruby
* Sinatra
* ActiveRecord
* BCrypt
* HTML
* CSS
* Postgres
* RSpec
* Sinatra/flash
* Database cleaner ActiveRecord


## Methods and tools used ##
* Trello 
* Miro
* DotUML
* Zoom
* Slack
* Agile processes for team management

<br>

## To set up the project ##

Clone the repository:

``` 
git clone git@github.com:plkujaw/makers-bnb.git
```
and run: 

```
bundle install
```
<br>

## To set up the databases: ##

Run in your console:
```
psql postgres
```

and run:
```
CREATE DATABASE makers_bnb;
```
To create the test database, run:
```
CREATE DATABASE makers_bnb_test;
```
Quit postgres with:
```
\q
```

And then run in terminal: 
```
SCRIPTS_DIR=/*path to Project's main directory*/db/migrations/
DATABASE_NAME=makers_bnb
for file in $SCRIPTS_DIR/*.sql
    do psql -U *your username* -d $DATABASE_NAME -f $file
done
```
<br>

For the test database, run:
```
SCRIPTS_DIR=/*path to Project's main directory*/db/migrations/
DATABASE_NAME=makers_bnb_test
for file in $SCRIPTS_DIR/*.sql
    do psql -U *your username* -d $DATABASE_NAME -f $file
done
```
<br>

## To run the app ##
```
rackup -p 3000
```
<br>

## User stories ##

User story 1:<br>
```
As a user,
So I can book and rent spaces<br>
I would like to be able to sign up for AirBnB
```

User story 2:<br>
```
As a user,
So I can log in
I would like to be able to log in and log out securely of the Air BnB 
```
User story 3: <br>
```
As a user,
So I can book a room
I would like to be able to see a list of spaces
```
User story 4:<br>
```
As a user
So other users can rent my space
I would like to list a space
```
User story 5:<br>
```
As a user
So other users can decide if they want to rent my space
I would like to be able to add a name, description and price to my space
```
User story 6:<br>
```
As a user
So I can see when a space is available
I would like to see available dates
```

User story 7:<br>
```
As a user
So I can book a room
I would like to be able to request to stay in a room
```

User story 8:<br>
```
As a user
So other users know when they book my spaces
I would like to set what dates my spaces are available
```

User story 9:<br>
```
As a user
So that I can book a space 
I would like to know if a space is unavailable
```
User story 10:<br>
```
As a user
So that I can know if a space is available
I would like to receive confirmation that a space is available
```
<br>

## Things to add ##

* Upload photos for your space
* You shouldn't be able to book a space that is not available
* You shouldn't be able to book your own space
* State persistence
* Date filters
* Filters in price
* Adding capacity to spaces
* Online chat
* Adding reviews
* Sending request/confirmation emails
* Buttons for easy navigation
* Static calendar 
<br>

## Class diagram ##

![Class diagram](docs/class_diagram.svg) 

## Database diagram ##

![DB diagram](docs/db_diagram.svg)

