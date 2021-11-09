/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


window.addEventListener("load", function () {
  const passwordInput = document.querySelector(".input");
  passwordInput.addEventListener("input", function (e) {
    const value = e.target.value;
    const checkLengthClass = e.target.parentNode.querySelector(".check-length");
    const checkUpperClass = e.target.parentNode.querySelector(".check-upper");
    const checkNumberClass = e.target.parentNode.querySelector(".check-number");
    const checkSpecialClass =
      e.target.parentNode.querySelector(".check-special");
    const checkItems = e.target.parentNode.querySelectorAll(".check-item");
    if (!value) {
      [...checkItems].forEach((item) => {
        item.classList.remove("active");
        item.classList.remove("unactive");
      });
      return;
    }
    if (value.length < 8) {
      checkLengthClass.classList.add("unactive");
      checkLengthClass.classList.remove("active");
    } else {
      checkLengthClass.classList.add("active");
      checkLengthClass.classList.remove("unactive");
    }
    passwordInputValidation(checkUpperClass, value, /[A-Z]/);
    passwordInputValidation(checkNumberClass, value, /[0-9]/);
    passwordInputValidation(checkSpecialClass, value, /[$@%^&*()}{[\]}!]/);
  });

  function passwordInputValidation(selector, value, regex) {
    if (!regex.test(value)) {
      selector.classList.add("unactive");
      selector.classList.remove("active");
    } else {
      selector.classList.add("active");
      selector.classList.remove("unactive");
    }
  }
  
    $("#success").click(function () {
  $(".notify").toggleClass("active");
  $("#notifyType").toggleClass("success");

  setTimeout(function () {
    $(".notify").removeClass("active");
    $("#notifyType").removeClass("success");
  }, 2000);
});

$("#failure").click(function () {
  $(".notify").addClass("active");
  $("#notifyType").addClass("failure");

  setTimeout(function () {
    $(".notify").removeClass("active");
    $("#notifyType").removeClass("failure");
  }, 2000);
});

});
