//jquery style
const $ = selector => document.querySelectorAll(selector);

const changeInputGroup = callback =>
  $(".input-wrapper input").forEach(input => {
    callback(input);
  });

const changeInputClass = input =>
  input.value === ""
    ? input.classList.remove("has-val")
    : input.classList.add("has-val");

//Event listeners for login form
const loginFormListener = input =>
  input.addEventListener("input", () => {
    changeInputClass(input);
  });

const loginFormGroupListeners = () => changeInputGroup(loginFormListener);

run = () => {
  changeInputGroup(changeInputClass); //Form animations on page load
  loginFormGroupListeners();
};

document.addEventListener("DOMContentLoaded", run);
