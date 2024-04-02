
 document.addEventListener("DOMContentLoaded", function() {
    // Get the logout button and confirmation popup
    var logoutBtn = document.getElementById("logoutBtn");
    var confirmPopup = document.getElementById("confirmPopup");

    // When the logout button is clicked, display the confirmation popup
    logoutBtn.addEventListener("click", function() {
        confirmPopup.style.display = "block";
    });

    // When the user clicks on the close button, close the popup
    document.querySelector(".close").addEventListener("click", function() {
        confirmPopup.style.display = "none";
    });

    // When the user clicks anywhere outside of the popup, close it
    window.addEventListener("click", function(event) {
        if (event.target == confirmPopup) {
            confirmPopup.style.display = "none";
        }
    });

    // When the user clicks on the "Cancel" button, close the popup
    document.getElementById("cancelLogout").addEventListener("click", function() {
        confirmPopup.style.display = "none";
    });
});
