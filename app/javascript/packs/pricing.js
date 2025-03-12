document.addEventListener("DOMContentLoaded", function() {
    let originSelect = document.getElementById("origin_agent");
    let destinationSelect = document.getElementById("destination_agent");
    let costDisplay = document.getElementById("delivery-cost");
  
    function updateCost() {
      let originId = originSelect.value;
      let destinationId = destinationSelect.value;
  
      if (originId && destinationId) {
        fetch(`/prices/calculate?origin_agent_id=${originId}&destination_agent_id=${destinationId}`)
          .then(response => response.json())
          .then(data => {
            costDisplay.textContent = `Ksh ${data.cost}`;
          })
          .catch(error => console.error("Error fetching price:", error));
      }
    }
  
    originSelect.addEventListener("change", updateCost);
    destinationSelect.addEventListener("change", updateCost);
  });
  