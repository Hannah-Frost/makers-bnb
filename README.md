# Makers BnB #

  This is a group project that uses Ruby and Rspec in order to recreate a BnB system.

## High level specification
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user - that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories
```
As a property owner,
so that I can add properties,
I would like to be able to sign in.
```
```
As a property owner,
so I can display a property,
I would like to list a property.
```
```
As a property owner,
so I can display lots of properties,
I would like to list multiple properties.
```
```
As a property owner,
so that people can find my property,
I would like to give my property a name.
```
```
As a property owner,
so that I can attract potential customers,
I want to add a description to my listing.
```
```
As a property owner,
so that a customer knows how much to pay,
I would like to add a price to my listing.
```
```
As a property owner,
so that a customer know when my property is available,
I would like to be able to show a range of available dates.
```
```
As a customer,
so that I can hire a space,
I would like to make a request for a space.
```
```
As a property owner,
so that I can be selective with hiring my property out,
I would like to approve a customer's request.
```
```
As a property owner,
so that my property can't be double-booked,
I would like to block unavailable dates from booking.
```
```
As a customer,
so that I can complete my booking,
I want to send confirmation of my booking.
```

## How to use the app

1. Clone this repository.
2. Run `bundle install` in your command line.
3. Set up the required databases (follow the 'How to set up the database' instructions below).
4. Type `ruby app.rb` into your command line to start the server.
5. Use the url `http://localhost:4567/` to view the app (you will only be able to view the app if you have started the server).

## How to set up the database

In your command line, type the following:
1. `psql` : open your user database.
2. `CREATE DATABASE makersbnb;` : create a database.
3. `CREATE DATABASE makersbnb_test;` : create a database for testing.
4. `\c makersbnb;` : connect to the bookmark_manager database.
5. Access 01_create__table.sql located within db/migrations/. Run the queries within both databases.
