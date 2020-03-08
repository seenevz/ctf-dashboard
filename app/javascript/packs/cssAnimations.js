//jquery style
const $ = selector => document.querySelectorAll(selector);

const changeInputClass = input => {
  input.value === ""
    ? input.classList.remove("has-val")
    : input.classList.add("has-val");
};

//Event listeners for login form
const loginFormListeners = () => {
  $(".input-wrapper input").forEach(input => {
    input.addEventListener("input", () => changeInputClass(input));
  });
};

document.addEventListener("DOMContentLoaded", loginFormListeners);
