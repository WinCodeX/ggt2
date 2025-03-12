// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function nextStep(step) {
    document.querySelectorAll("div[id^='package-form-step']").forEach(el => el.classList.add("hidden"));
    let currentStep = document.getElementById(`package-form-step-${step}`);
    currentStep.classList.remove("hidden");
    currentStep.classList.add("fade-in");
  }
  
  function updateDeliveryDetails() {
    document.getElementById("door_delivery_fields").classList.add("hidden");
    document.getElementById("agent_pickup_fields").classList.add("hidden");
    document.getElementById("parcel_delivery_fields").classList.add("hidden");
  
    let selectedType = document.getElementById("delivery_type").value;
    if (selectedType === "door_delivery") {
      document.getElementById("door_delivery_fields").classList.remove("hidden");
    } else if (selectedType === "agent_pickup") {
      document.getElementById("agent_pickup_fields").classList.remove("hidden");
    } else if (selectedType === "parcel_delivery") {
      document.getElementById("parcel_delivery_fields").classList.remove("hidden");
    }
  }
  