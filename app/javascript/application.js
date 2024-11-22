// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"



document.addEventListener("turbo:load", () => {
  document.body.addEventListener("click", (event) => {
    const cartToggle = document.getElementById("cart-toggle");
    const cartMenu = document.getElementById("cart-menu");

    if (cartToggle && cartMenu) {
      if (event.target === cartToggle) {
        cartMenu.classList.toggle("open");
        console.log("Toggle cart menu");
      } else if (!cartMenu.contains(event.target)) {
        cartMenu.classList.remove("open");
      }
    }
  });
});

document.addEventListener("turbo:load", function() {
  
  setTimeout(function() {
    const messages = document.querySelectorAll('.flash-message');
    messages.forEach(message => {
      message.classList.add('hide');
    });
  }, 3000);
});
