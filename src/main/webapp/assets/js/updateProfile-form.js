const exampleModal = document.getElementById('updateProfileModal');
const email = document.getElementById('email').readOnly = true;

exampleModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget;
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever');

    // If necessary, you could initiate an AJAX request here
    // and then do the updating in a callback.
    $.ajax({
        url: '',
        method: 'POST',
        data: { param1: 'name', param2: 'phone', param3: 'dob', param4: 'address' },
        success: function(response) {
            // Parse the response JSON data
            const data = JSON.parse(response);

            // Update the form fields with the data received from the AJAX call
            const nameInput = exampleModal.querySelector('#name');
            const emailInput = exampleModal.querySelector('#email');
            const phoneInput = exampleModal.querySelector('#phone');
            const dobInput = exampleModal.querySelector('#dob');
            const addressInput = exampleModal.querySelector('#address');

            nameInput.value = data.name;
            emailInput.value = data.email;
            phoneInput.value = data.phone;
            dobInput.value = data.dob;
            addressInput.value = data.address;
        },
        error: function(xhr, status, error) {
            // Handle the error
            console.log('Error:', error);
        }
    });

    // Update the modal's content.
    const modalTitle = exampleModal.querySelector('.modal-title');
    modalTitle.textContent = `Update your ${recipient}`;
});

// Add an event listener to the "Save" button
exampleModal.querySelector('.btn-primary').addEventListener('click', () => {
    // Get the updated form data
    const formData = {
        name: exampleModal.querySelector('#name').value,
        email: exampleModal.querySelector('#email').value,
        phone: exampleModal.querySelector('#phone').value,
        dob: exampleModal.querySelector('#dob').value,
        address: exampleModal.querySelector('#address').value
    };

    // Send the updated data to the server via AJAX
    $.ajax({
        url: '',
        method: 'POST',
        data: formData,
        success: function(response) {
            // Close the modal
            exampleModal.modal('hide');

            // Update the page with the response data
            $('#target-element').html(response);
        },
        error: function(xhr, status, error) {
            // Handle the error
            console.log('Error:', error);
        }
    });
});
