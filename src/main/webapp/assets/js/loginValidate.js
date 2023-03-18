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
    xhr.open('POST', '/dang-nhap');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = () => {
        // Handle response
        if (xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            if (response.role === 'admin') {
                // Redirect to admin dashboard
                window.location.href = '/admin-dashboard';
            } else if (response.role === 'staff') {
                // Redirect to staff dashboard
                window.location.href = '/staff-dashboard+';
            } else {
                // Redirect to customer dashboard
                window.location.href = '/home';
            }
        } else {
            // Login failure
            alert(xhr.responseText);
        }
    };
    xhr.send(`email=${email}&password=${password}`);
});