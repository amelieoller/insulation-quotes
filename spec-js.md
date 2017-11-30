# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements //-- 
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend. //-- /insulation_types/:id and /accessories/:id include next button for next show page
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend. //-- /quotes/:id view all related accessories
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM. //-- /quotes/:id renders accessories (quotes have many accessories)
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh. //-- /accessories create a new accessory
- [x] Translate JSON responses into js model objects. //-- /accessories Accessory is translated into a js model object in accessories.js
- [x] At least one of the js model objects must have at least one method added by your code to the prototype. //-- Accessory.prototype.renderLI renders each new accessory list item

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
