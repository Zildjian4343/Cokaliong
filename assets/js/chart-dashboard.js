  // Get the canvas element
  const ctx = document.getElementById('monthlyEarningsChart').getContext('2d');

  // Create gradient for the bars
  const barGradient = ctx.createLinearGradient(0, 0, 0, 400);
  barGradient.addColorStop(0, 'rgba(255, 99, 132, 0.8)');
  barGradient.addColorStop(0.5, 'rgba(54, 162, 235, 0.8)');
  barGradient.addColorStop(1, 'rgba(75, 192, 192, 0.8)');

  // Define the data sample
  const data = {
      labels: [
          'January', 'February', 'March', 'April', 'May', 
          'June', 'July', 'August', 'September', 'October', 'November', 'December'
      ],
      datasets: [{
          label: 'Monthly Earnings (₱)',
          data: [12000, 15000, 13000, 14000, 17000, 16000, 19000, 20000, 21000, 18000, 22000, 25000],
          backgroundColor: barGradient,
          borderColor: 'rgba(0, 0, 0, 0.8)',
          borderWidth: 1,
          hoverBackgroundColor: 'rgba(255, 206, 86, 0.8)',
          hoverBorderColor: 'rgba(255, 206, 86, 1)',
      }]
  };

  const options = {
      responsive: true,
      plugins: {
          legend: {
              position: 'top',
              labels: {
                  color: '#000', 
                  font: {
                      size: 14,
                  }
              }
          },
          tooltip: {
              backgroundColor: 'rgba(0, 0, 0, 0.7)',
              titleColor: '#fff',
              bodyColor: '#fff',
          }
      },
      scales: {
          x: {
              ticks: {
                  color: '#000', 
                  font: {
                      size: 12,
                  }
              },
              grid: {
                  display: false
              }
          },
          y: {
              ticks: {
                  color: '#000', 
                  font: {
                      size: 12,
                  }
              },
              grid: {
                  color: 'rgba(0, 0, 0, 0.1)',
              }
          }
      }
  };
  new Chart(ctx, {
      type: 'bar',
      data: data,
      options: options
  });