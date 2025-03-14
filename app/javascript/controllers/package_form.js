function nextStep(step) {
    // Ensure all previous steps are filled
    let currentStep = step - 1;
    let inputs = document.querySelectorAll(`#package-form-step-${currentStep} input[required]`);
    for (let input of inputs) {
        if (!input.value.trim()) {
            alert("Please fill out all required fields before proceeding.");
            return;
        }
    }

    // Hide all steps
    document.querySelectorAll("div[id^='package-form-step']").forEach(el => el.classList.add("hidden"));

    // Show the next step
    let nextStepElement = document.getElementById(`package-form-step-${step}`);
    if (nextStepElement) {
        nextStepElement.classList.remove("hidden");
        nextStepElement.classList.add("fade-in");
    }
}

// Attach function to global scope
window.nextStep = nextStep;

  
    
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
    
  
    window.submitPackage = function () {
      let data = {
        recipient_name: document.getElementById("recipient_name").value,
        recipient_phone: document.getElementById("recipient_phone").value,
        package_description: document.getElementById("package_description").value,
        package_value: document.getElementById("package_value").value,
        sender_agent_id: document.getElementById("sender_agent_id").value,
        delivery_type: document.getElementById("delivery_type").value,
      };
    
      // Add relevant delivery details based on type
      if (data.delivery_type === "door_delivery") {
        data.delivery_details = document.getElementById("exact_location").value;
      } else if (data.delivery_type === "agent_pickup") {
        data.delivery_details = document.getElementById("receiver_agent_id").value;
      } else if (data.delivery_type === "parcel_delivery") {
        data.delivery_details = {
          courier_service: document.getElementById("courier_service").value,
          destination: document.getElementById("destination").value,
        };
      }
    
      // Send data to backend
      fetch("/packages", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data),
      }).then(response => response.json())
        .then(data => {
          alert("Package Created! Redirecting to Payment...");
          window.location.href = `/payments?package_id=${data.id}`;
        });
    };
  
    
  
  
    function updatePrice() {
      let senderAgent = document.getElementById("sender_agent_id").value;
      let receiverAgent = document.getElementById("receiver_agent_id").value;
    
      if (senderAgent && receiverAgent) {
        fetch(`/get_price?sender_agent_id=${senderAgent}&receiver_agent_id=${receiverAgent}`)
          .then(response => response.json())
          .then(data => {
            if (data.cost) {
              document.getElementById("delivery-cost").innerText = `Ksh ${data.cost}`;
            } else {
              document.getElementById("delivery-cost").innerText = "Pricing not available";
            }
          });
      }
    }
  
  
  
    function fetchDeliveryCost() {
      let senderLocation = document.getElementById("sender_location_id").value;
      let receiverLocation = document.getElementById("receiver_location_id").value;
    
      if (senderLocation && receiverLocation) {
        fetch(`/prices/get_price?origin_location_id=${senderLocation}&destination_location_id=${receiverLocation}`)
          .then(response => response.json())
          .then(data => {
            document.getElementById("delivery-cost").innerText = `Ksh ${data.price}`;
          })
          .catch(error => console.error("Error fetching price:", error));
      }
    }
    
    console.log("🚀 JavaScript Loaded Successfully!");