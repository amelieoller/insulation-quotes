# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project //-- Using Rails
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) //-- A quote has_many applications
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) //-- An application belongs_to a quote
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) //-- A quote has_many insulation_types through applications
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) //-- Insulation types can be created and edited
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) //-- Application validates the presence of important attributes
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) //-- The quote model has the from_today class method
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) //-- Custom attribute writer for accessories in quote.rb
- [x] Include signup (how e.g. Devise) //-- Signup at http://localhost:3000/users/sign_up
- [x] Include login (how e.g. Devise) //-- Login at http://localhost:3000/users/sign_in
- [x] Include logout (how e.g. Devise) //-- Logout button in the navigation bar
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) //-- Signup/Login through Google OAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) //-- Nested resource index at e.g. http://localhost:3000/quotes/14/accessories
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) //-- Nested new at e.g. http://localhost:3000/quotes/14/accessories/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) //-- Validations e.g. at http://localhost:3000/quotes/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
