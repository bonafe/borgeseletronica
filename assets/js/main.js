/**
 * Borges Eletrônica — comportamento progressivo do site.
 * Todo o conteúdo essencial (navegação, serviços, contato) já funciona
 * sem este arquivo. Aqui só vive o que é puramente uma melhoria de UX.
 */
(function () {
  "use strict";

  /* -------- Eventos de medição (stub) --------
   * Registra apenas a origem do clique, nunca dados digitados pelo
   * visitante (telefone, marca, modelo, defeito). Pronto para plugar
   * uma ferramenta de analytics real depois — hoje só loga no console.
   */
  function trackEvent(name, meta) {
    if (window.console && console.info) {
      console.info("[trackEvent]", name, meta || {});
    }
  }
  window.trackEvent = trackEvent;

  document.addEventListener("click", function (event) {
    var el = event.target.closest("[data-track]");
    if (!el) return;
    var name = el.getAttribute("data-track");
    var origin = el.getAttribute("data-track-origin") || "unknown";
    trackEvent(name, { origin: origin });
  });

  /* -------- Cabeçalho compacto ao rolar -------- */
  var header = document.querySelector(".site-header");
  if (header) {
    var lastCompact = false;
    var onScroll = function () {
      var shouldCompact = window.scrollY > 24;
      if (shouldCompact !== lastCompact) {
        header.classList.toggle("is-compact", shouldCompact);
        lastCompact = shouldCompact;
      }
    };
    document.addEventListener("scroll", onScroll, { passive: true });
    onScroll();
  }

  /* -------- Menu mobile -------- */
  var menuToggle = document.querySelector(".menu-toggle");
  var mobileMenu = document.querySelector(".mobile-menu");
  var menuClose = document.querySelector(".mobile-menu-close");

  function openMenu() {
    if (!mobileMenu) return;
    mobileMenu.classList.add("is-open");
    mobileMenu.removeAttribute("hidden");
    menuToggle.setAttribute("aria-expanded", "true");
    document.body.style.overflow = "hidden";
    var firstLink = mobileMenu.querySelector("a, button");
    if (firstLink) firstLink.focus();
  }

  function closeMenu() {
    if (!mobileMenu) return;
    mobileMenu.classList.remove("is-open");
    mobileMenu.setAttribute("hidden", "");
    menuToggle.setAttribute("aria-expanded", "false");
    document.body.style.overflow = "";
    menuToggle.focus();
  }

  if (menuToggle && mobileMenu) {
    menuToggle.addEventListener("click", openMenu);
    if (menuClose) menuClose.addEventListener("click", closeMenu);
    mobileMenu.addEventListener("click", function (event) {
      if (event.target.tagName === "A") closeMenu();
    });
    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape" && mobileMenu.classList.contains("is-open")) {
        closeMenu();
      }
    });
  }

  /* -------- Ano dinâmico no rodapé -------- */
  var yearEls = document.querySelectorAll("[data-current-year]");
  yearEls.forEach(function (el) {
    el.textContent = String(new Date().getFullYear());
  });

  /* -------- Acordeão de perguntas frequentes -------- */
  var faqButtons = document.querySelectorAll(".faq-question");
  faqButtons.forEach(function (button) {
    button.addEventListener("click", function () {
      var expanded = button.getAttribute("aria-expanded") === "true";
      var panelId = button.getAttribute("aria-controls");
      var panel = panelId ? document.getElementById(panelId) : null;

      button.setAttribute("aria-expanded", String(!expanded));
      if (panel) {
        if (expanded) {
          panel.setAttribute("hidden", "");
        } else {
          panel.removeAttribute("hidden");
          trackEvent("faq_open", { question: button.textContent.trim() });
        }
      }
    });
  });
})();
