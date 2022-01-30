// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers/application"
import "controllers/hello_controller"
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require_tree .

$("#book_year").datepicker({
    format: "yyyy",
    viewMode: "years",
    minViewMode: "years"
});

