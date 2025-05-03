import "@hotwired/turbo-rails";
import "chartkick"
import "Chart.bundle"
import "@rails/ujs"
Rails.start()


document.addEventListener("turbo:load", () => {
  console.log("Turbo load event fired");

  const flashMessages = document.querySelectorAll('.flash-message');
  flashMessages.forEach((message) => {
    setTimeout(() => {
      console.log("Removing message:", message.textContent);
      message.remove();
    }, 4000);
  });
});
