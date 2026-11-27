(function () {
  "use strict";

  var modal = document.getElementById("card-game-modal");
  if (!modal) return;

  var trigger = document.querySelector('#footer a[href="#card-game-modal"]');
  var closeButtons = modal.querySelectorAll("[data-card-game-close]");
  var card = modal.querySelector(".card-game");
  var front = modal.querySelector(".card-game__front");
  var status = modal.querySelector(".card-game-modal__status");
  var closeButton = modal.querySelector(".card-game-modal__close");
  var previousFocus = null;
  var currentCardName = null;
  var flipTimer = null;
  var cards = [
    { src: "/assets/cards/ada.png", name: "Ada Lovelace" },
    { src: "/assets/cards/florence.png", name: "Florence Nightingale" },
    { src: "/assets/cards/katherine.png", name: "Katherine Johnson" }
  ];

  if (trigger) {
    trigger.setAttribute("aria-label", "Open the Women in Maths card game");
    trigger.setAttribute("title", "Play the Women in Maths card game");
    trigger.addEventListener("click", function (event) {
      event.preventDefault();
      previousFocus = trigger;
      modal.hidden = false;
      modal.setAttribute("aria-hidden", "false");
      document.body.classList.add("card-game-open");
      window.clearTimeout(flipTimer);
      currentCardName = null;
      card.classList.remove("is-flipped");
      card.setAttribute("aria-label", "Flip the card");
      status.textContent = "Click the card to flip it.";
      closeButton.focus();
    });
  }

  function closeModal() {
    window.clearTimeout(flipTimer);
    modal.hidden = true;
    modal.setAttribute("aria-hidden", "true");
    document.body.classList.remove("card-game-open");
    if (previousFocus) previousFocus.focus();
  }

  closeButtons.forEach(function (button) {
    button.addEventListener("click", closeModal);
  });

  function drawCard() {
    var availableCards = cards.filter(function (candidate) {
      return candidate.name !== currentCardName;
    });
    var selected = availableCards[Math.floor(Math.random() * availableCards.length)];
    currentCardName = selected.name;
    front.src = selected.src;
    front.alt = selected.name;
    card.classList.add("is-flipped");
    status.textContent = selected.name;
    card.setAttribute("aria-label", "Show another card");
  }

  card.addEventListener("click", function () {
    if (card.classList.contains("is-flipped")) {
      card.classList.remove("is-flipped");
      card.setAttribute("aria-label", "Flip to another card");
      status.textContent = "Drawing another card…";
      window.clearTimeout(flipTimer);
      flipTimer = window.setTimeout(drawCard, 700);
      return;
    }

    drawCard();
  });

  modal.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      closeModal();
      return;
    }

    if (event.key === "Tab") {
      var focusable = modal.querySelectorAll('button:not([disabled]), a[href]');
      var first = focusable[0];
      var last = focusable[focusable.length - 1];
      if (event.shiftKey && document.activeElement === first) {
        event.preventDefault();
        last.focus();
      } else if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault();
        first.focus();
      }
    }
  });
})();
