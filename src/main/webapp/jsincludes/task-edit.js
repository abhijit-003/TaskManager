/**
 * 
 */
 
 
//Get the edit popup element
var editPopup = document.getElementById('edit-popup');

// Get the button that opens the edit popup
var editBtns = document.querySelectorAll('.edit-btn');

// Get the <span> element that closes the edit popup
var closeBtn = document.getElementsByClassName('close-btn')[0];

// When the user clicks on the edit button, open the edit popup
editBtns.forEach(function(btn) {
    btn.onclick = function() {
        editPopup.style.display = 'block';
    }
});

// When the user clicks on <span> (x), close the edit popup
closeBtn.onclick = function() {
    editPopup.style.display = 'none';
}

// When the user clicks anywhere outside of the edit popup, close it
window.onclick = function(event) {
    if (event.target == editPopup) {
        editPopup.style.display = 'none';
    }
};

// When the user submits the edit form, close the edit popup
var editForm = document.querySelector('#edit-popup form');
editForm.onsubmit = function(event) {
    event.preventDefault(); // Prevent the form from submitting
    editPopup.style.display = 'none'; // Close the edit popup
};

// When the user presses the Escape key, close the edit popup
document.onkeydown = function(event) {
    if (event.key === 'Escape') {
        editPopup.style.display = 'none'; // Close the edit popup
    }
};
