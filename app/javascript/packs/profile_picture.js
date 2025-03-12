document.addEventListener("DOMContentLoaded", function () {
    const profileModal = document.getElementById("profile-modal");
    const openModalBtn = document.getElementById("open-profile-modal");
    const closeModalBtn = document.getElementById("close-profile-modal");
    const saveProfilePictureBtn = document.getElementById("save-profile-picture");
    const profilePictureInput = document.getElementById("profile-picture-input");
    const modalImagePreview = document.getElementById("modal-image-preview");
    const profilePicturePreview = document.getElementById("profile-picture-preview");
    const chooseNewImageBtn = document.getElementById("choose-new-image");
  
    // Open Modal
    openModalBtn.addEventListener("click", function () {
      profileModal.classList.remove("hidden");
    });
  
    // Close Modal
    closeModalBtn.addEventListener("click", function () {
      profileModal.classList.add("hidden");
    });
  
    // Choose New Image
    chooseNewImageBtn.addEventListener("click", function () {
      profilePictureInput.click();
    });
  
    // Handle Image Selection
    profilePictureInput.addEventListener("change", function () {
      const file = profilePictureInput.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
          modalImagePreview.src = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    });
  
    // Save Image and Close Modal
    saveProfilePictureBtn.addEventListener("click", function () {
      profilePicturePreview.src = modalImagePreview.src;
      profileModal.classList.add("hidden");
    });
  });
  