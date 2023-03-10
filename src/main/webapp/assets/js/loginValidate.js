// function validateForm() {
//     // Get the value of the input field with id="email"
//     const email = document.getElementById("exampleInputEmail").value;
//     // Get the value of the input field with id="password"
//     const password = document.getElementById("exampleInputPassword").value;
//     // Regular expression to check if the email is in the correct format
//     const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
//     // Check if the email is empty
//     if (email == "") {
//         alert("Email field must be filled out");
//         return false;
//     }
//     // Check if the email is in the correct format
//     if (!email.match(emailRegex)) {
//         alert("Please enter a valid email address");
//         return false;
//     }
//     // Check if the password is empty
//     if (password == "") {
//         alert("Password field must be filled out");
//         return false;
//     }
//     // Send a request to the server to check the user's credentials
//     // If the credentials are correct, return true to submit the form
//     // If the credentials are incorrect, display an error message and return false to prevent the form from being submitted
//     return true;
// }

const loginForm = document.getElementById('login-form');



loginForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    // Validate email and password
    if (email == "") {
        alert("Email field must be filled out");
        return false;
    }else if (!email.match(emailRegex)){
        alert("Please enter a valid email address");
        return false;
    }else if (password == ""){
        alert("Password field must be filled out");
        return false;
    }else {
        return true;
    }
    // ...

    // Send AJAX request
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/login.jsp');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = () => {
        // Handle response
        // ...
    };
    xhr.send(`email=${email}&password=${password}`);
});