// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll(".see-more").forEach(function (link) {
    link.addEventListener("click", function (event) {
      event.preventDefault();
      const taskDescription = link.closest(".task-description");
      taskDescription.querySelector(".short-description").classList.toggle("hidden");
      taskDescription.querySelector(".full-description").classList.toggle("hidden");
      link.classList.toggle("hidden");
    });
  });

  document.querySelectorAll(".show-less").forEach(function (link) {
    link.addEventListener("click", function (event) {
      event.preventDefault();
      const taskDescription = link.closest(".task-description");
      taskDescription.querySelector(".short-description").classList.toggle("hidden");
      taskDescription.querySelector(".full-description").classList.toggle("hidden");
      taskDescription.querySelector(".see-more").classList.toggle("hidden");
    });
  });
});