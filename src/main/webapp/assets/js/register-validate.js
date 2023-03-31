// Select all input elements for varification
const name = document.querySelector('#user-name');
const emailElm = document.querySelector('#user-email');
const passwordElm = document.querySelector('#user-password')
const rePassword = document.querySelector('#user-re-password');
const btnRegis = document.getElementById("btn-register");
const form = document.querySelector('#register');

form.addEventListener('register', function (e) {
    e.preventDefault();
});

const isRequired = value => value === '' ? false : true;
const checkLength = (length, min, max) => length < min || length > max ? false : true;
const checkPass = (password) => {
    const re = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
    return re.test(password);
};
const checkMail = (email) => {
    const em = new RegExp("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+");
    return em.test(email);
};

const showError = (input, message) => {

    const formField = input.parentElement;

    formField.classList.remove('success');
    formField.classList.add('error');
    formField.classList.add("removeSpace");


    const error = formField.querySelector('small');
    error.textContent = message;
};

const showSuccess = (input) => {

    const formField = input.parentElement;


    formField.classList.remove('error');
    formField.classList.add('success');

    const error = formField.querySelector('small');
    error.textContent = '';
}

const checkUsername = () => {

    let valid = false;
    const min = 3,
        max = 20;
    const username = name.value.trim();

    if (!isRequired(username)) {
        showError(name, 'Username is required.');
    } else if (!checkLength(username.length, min, max)) {
        showError(name, `Username must be between ${min} and ${max} characters.`)
    } else {
        showSuccess(name);
        valid = true;
    }
    return valid;
}

const checkPassword = () => {

    let valid = false;

    const password = passwordElm.value.trim();

    if (!isRequired(password)) {
        showError(passwordElm, 'Password is required.');
    } else if (!checkPass(password)) {
        showError(passwordElm, 'Password must has at least 8 characters that include at least 1 lowercase character, 1 uppercase characters, 1 number, and 1 special character in (!@#$%^&*)');
    } else {
        showSuccess(passwordElm);
        valid = true;
    }

    return valid;
};

const checkConfirmPassword = () => {
    let valid = false;

    const confirmPassword = rePassword.value.trim();
    const password = passwordElm.value.trim();

    if (!isRequired(confirmPassword)) {
        showError(rePassword, 'Confirm password is required.');
    } else if (password !== confirmPassword) {
        showError(rePassword, 'Confirm password does not match');
    } else {
        showSuccess(rePassword);
        valid = true;
    }

    return valid;
};

const checkEmail = () => {
    let valid = false;

    const email = emailElm.value.trim();

    if (!isRequired(email)) {
        showError(emailElm, 'Email is required.');
    } else if (!checkMail(email)) {
        showError(emailElm, 'Email is not valid');
    } else {
        showSuccess(emailElm);
        valid = true;
    }

    return valid;
};

form.addEventListener('submit', function (e) {

    e.preventDefault();


    let isUsernameValid = checkUsername(),
        isEmailValid = checkEmail(),
        isPasswordValid = checkPassword(),
        isConfirmPasswordValid = checkConfirmPassword();

    let isFormValid = isUsernameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid;

    if (isFormValid) {
        form.submit();
    }else {
        let msg = document.getElementById('title');
        msg.innerHTML = 'Please fill input correctly';
        msg.style.color = 'red';
    }
});

form.addEventListener('input', function (e) {
    switch (e.target.id) {
        case 'user-name':
            checkUsername();
            break;
        case 'user-email':
            checkEmail();
            break;
        case 'user-password':
            checkPassword();
            break;
        case 'user-re-password':
            checkConfirmPassword();
            break;
    }
});