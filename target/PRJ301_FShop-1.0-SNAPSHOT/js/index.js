/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validateName() {
  var name = document.getElementById("name").value;
  if (name.length < 2 || name.length > 20) {
    document.getElementById("nameError").innerHTML = "Name must be between 2 and 20 characters.";
    return false;
  }
  return true;
}

function validateEmail() {
  var email = document.getElementById("email").value;
  if (email.indexOf("@") == -1) {
      console.log("cehck");
    document.getElementById("emailError").innerHTML = "Email must contain the @ symbol.";
    return false;
  }
  return true;
}

function validateAge() {
  var age = document.getElementById("age").value;
  if (isNaN(age) || age < 18 || age > 120) {
    document.getElementById("ageError").innerHTML = "Age must be a number between 18 and 120.";
    return false;
  }
  return true;
}

