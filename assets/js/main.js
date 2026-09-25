/*
 * Sample Project: progressive enhancements.
 * Everything here is optional. The page works with JavaScript disabled.
 */
(function () {
  'use strict';

  /* Mobile nav toggle ----------------------------------------------------- */

  var header = document.querySelector('.site-header');
  var toggle = document.querySelector('.nav-toggle');
  var nav = document.getElementById('site-nav');
  var smallScreen = window.matchMedia('(max-width: 39.99em)');

  function applyNavMode() {
    if (!toggle || !nav || !header) return;
    if (smallScreen.matches) {
      header.classList.add('js-nav-enhanced');
      toggle.hidden = false;
    } else {
      header.classList.remove('js-nav-enhanced');
      toggle.hidden = true;
      nav.classList.remove('is-open');
      toggle.setAttribute('aria-expanded', 'false');
    }
  }

  if (toggle && nav && header) {
    toggle.addEventListener('click', function () {
      var open = nav.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(open));
    });

    // Close the menu after choosing a link
    nav.addEventListener('click', function (event) {
      if (event.target.tagName === 'A') {
        nav.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
      }
    });

    applyNavMode();
    if (smallScreen.addEventListener) {
      smallScreen.addEventListener('change', applyNavMode);
    } else if (smallScreen.addListener) {
      smallScreen.addListener(applyNavMode);
    }
  }

  /* Contact form validation ---------------------------------------------- */

  var form = document.querySelector('.form');
  if (!form) return;

  var status = form.querySelector('.form__status');

  function messageFor(field) {
    if (field.validity.valueMissing) {
      return 'Please fill in this field.';
    }
    if (field.validity.typeMismatch && field.type === 'email') {
      return 'Please enter a valid email address, like name@example.com.';
    }
    return 'Please check this field.';
  }

  function validateField(field) {
    var error = document.getElementById(field.id + '-error');
    if (!error) return true;
    if (field.checkValidity()) {
      field.removeAttribute('aria-invalid');
      error.textContent = '';
      return true;
    }
    field.setAttribute('aria-invalid', 'true');
    error.textContent = messageFor(field);
    return false;
  }

  var fields = Array.prototype.slice.call(form.querySelectorAll('input, textarea'));

  fields.forEach(function (field) {
    field.addEventListener('blur', function () {
      validateField(field);
    });
    field.addEventListener('input', function () {
      if (field.getAttribute('aria-invalid') === 'true') {
        validateField(field);
      }
    });
  });

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    if (status) status.textContent = '';

    var firstInvalid = null;
    fields.forEach(function (field) {
      var ok = validateField(field);
      if (!ok && !firstInvalid) firstInvalid = field;
    });

    if (firstInvalid) {
      firstInvalid.focus();
      return;
    }

    if (status) {
      status.textContent = 'Thanks! This is a front-end only demo, so nothing was actually sent.';
    }
    form.reset();
  });
})();
