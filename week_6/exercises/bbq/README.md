BBQ
===

A Rails practice app.

This app is supposed to help people organize barbecues
but it's got a few problems.


Task #1: Authentication
-----------------------

As it is now, anyone who visits the site can create a new barbecue.
We would like visitors to have to register before they can access the site.

1. Add authentication to the app with
[devise](http://devise.plataformatec.com.br) or the method of your choice.
2. Prevent anonymous users from accessing the routes of `BarbecuesController`.
3. Add a small user profile header section
with the user's name, email and a log out button.


Task #2: Fix the barbecue page
------------------------------

The list of barbecues has links to the individual barbecue pages.
If you open one of those pages, instead of seeing the barbecue's information you
get an error.
As it turns out, the barbecue page is trying to call an API via JavaScript to
retrieve that data.

1. Create a route that responds to GET requests on URLs like
`/api/barbecues/:id`,
where `:id` is a placeholder for a barbecue's ID.
2. The API needs to respond with a JSON object with the barbecue's `title`,
`date` and `venue` properties.


Task #3: Allow users to join a BBQ
----------------------------------

On the home page you might have noticed that each BBQ has a *Join* button.
If you try to click that button, you will get an error.
That button also attempts to use of an API call to add the user to the BBQ.

1. Add an association to `Barbecue` for the users who are going to the BBQ.
2. Create a route that responds to POST requests on URLs like
`/api/barbecues/:id/join`,
where `:id` is a placeholder for a barbecue's ID.
3. The API needs to add the logged-in user to the selected BBQ's association.
4. The API should also respond with JSON
indicating whether or not the call was successful.
