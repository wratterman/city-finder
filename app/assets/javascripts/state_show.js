function fillMostDangerousCities(crime) {
  var stateId = $(".myInfo").attr("id")
  $.ajax({
    type: "GET",
    url: `http://localhost:3000/api/v1/crime_states/${stateId}/most_dangerous_cities?crime=${crime}&limit=5`,
    success: function(data) {
      $(".dangerousCitiesList").empty()
      data.most_dangerous_cities.forEach(function(city) {
        var rowWithName = `<div class="dangerCities"><li class=${city.name} id=${city.id}>City: ${city.name}</li>`
        var rowWithCrime = identifyCrime(crime, city)
        var rowWithLink = `<a href=${stateId}/cities/${city.id}>View More</div> <br>`
        $(".dangerousCitiesList").append(rowWithName + rowWithCrime + rowWithLink)
    })
    }
  })
}

function fillSafestCities(crime) {
  var stateId = $(".myInfo").attr("id")
  $.ajax({
    type: "GET",
    url: `http://localhost:3000/api/v1/crime_states/${stateId}/safest_cities?crime=${crime}&limit=5`,
    success: function(data) {
      $(".safestCitiesList").empty()
      data.safest_cities.forEach(function(city) {
        var rowWithName = `<div class="safeCities"><li class=${city.name} id=${city.id}>City: ${city.name}</li>`
        var rowWithCrime = identifyCrime(crime, city)
        var rowWithLink = `<a href=${stateId}/cities/${city.id}>View More</div> <br>`
        $(".safestCitiesList").append(rowWithName + rowWithCrime + rowWithLink)
      })
    }
  })
}

function fillEconChart() {
  var stateId = $(".myInfo").attr("id")
  $.ajax({
    type: "GET",
    url: `http://localhost:3000/api/v1/avg_weekly_reports/${stateId}`,
    success: function(data) {
      var weekly_hours = []
      var hourly_wages = []
      var weekly_earnings = []
      data.avg_weekly_reports.forEach(function(report) {
        weekly_hours.push({"MonthYear": report.month_year, "weeklyHours": parseFloat(report.avg_weekly_hours)})
        hourly_wages.push({"MonthYear": report.month_year, "hourlyWages": parseFloat(report.avg_hourly_wages)})
        weekly_earnings.push({"MonthYear": report.month_year, "weeklyEarnings": parseFloat(report.avg_weekly_earnings)})
      })
      fillLineGraph(weekly_hours, "weeklyHours")
      fillLineGraph(hourly_wages, "hourlyWages")
      fillLineGraph(weekly_earnings, "weeklyEarnings")
    }
  })
}

function fillLineGraph(data, reportName) {
  $(`.${reportName}Container`).empty()
  var svg = dimple.newSvg(`.${reportName}Container`,  250, 250);
  var myChart = new dimple.chart(svg, data)
  myChart.setBounds(45, 15, 200, 150)
  var x = myChart.addCategoryAxis("x", "MonthYear")
  x.addOrderRule("Date")
  myChart.addMeasureAxis("y", reportName)
  var s = myChart.addSeries(null, dimple.plot.line)
  myChart.draw()
}

function crimeFilterListener() {
  $("#crimeDropdown").on("click", function() {
    var crime = event.target.classList.value
    var crimeName = event.target.innerText
    fillMostDangerousCities(crime)
    fillSafestCities(crime)
    crimeFilterListener()
    $(".currentCrimeFilter").empty()
    $(".currentCrimeFilter").append(crimeName)
  })
}

function identifyCrime(crime, city) {
  switch (crime) {
    case "violent_crime":
      return `<li class="crime">Violent Crime Rate: ${city.violent_crime_rate}</li>`
      break;
    case "murder":
      return `<li class="crime">Murder/Manslaughter Rate: ${city.murder_manslaughter_rate}</li>`
      break;
    case "rape":
      return `<li class="crime">Rape Rate: ${city.rape_rate}</li>`
      break;
    case "robbery":
      return `<li class="crime">Robbery Rate: ${city.robbery_rate}</li>`
      break;
    case "aggrevated_assault":
      return `<li class="crime">Aggrevated Assault Rate: ${city.aggrevated_assault_rate}</li>`
      break;
    case "property_crime":
      return `<li class="crime">Property Crime Rate: ${city.property_crime_rate}</li>`
      break;
    case "burglary":
      return `<li class="crime">Burglary Rate: ${city.burglary_rate}</li>`
      break;
    case "larceny_theft":
      return `<li class="crime">Larceny Theft Rate: ${city.larceny_theft_rate}</li>`
      break;
    case "motor_vehicle_theft":
      return `<li class="crime">Motor Vehicle Theft Rate: ${city.motor_vehicle_theft_rate}</li>`
      break;
  }
}

$(document).ready(function() {
  fillMostDangerousCities("violent_crime")
  fillSafestCities("violent_crime")
  fillEconChart()
  crimeFilterListener()
})
