// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers/application"
import "controllers/hello_controller"
import "vendor/jquery"
import "vendor/bootstrap"

let counter = document.getElementById("counter_on_book_page");

document.getElementById("counter_plus").addEventListener("click", function() {
    counter.value +=1;
})
document.getElementById("counter_minus").addEventListener("click", function() {
    counter.value -=1;
})