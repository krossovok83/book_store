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


window.fbAsyncInit = function() {
    FB.init({
        appId      : '{your-app-id}',
        cookie     : true,
        xfbml      : true,
        version    : '{api-version}'
    });
    FB.AppEvents.logPageView();
};

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
