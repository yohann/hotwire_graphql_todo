// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll(".see-more").forEach(function (link) {
    link.addEventListener("click", function (event) {
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