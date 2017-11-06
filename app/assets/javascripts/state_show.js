function fillMostDangerousCities(crime) {
  let stateId = $(".myInfo").attr("id")
  $.ajax({
    type: "GET",
    url: `http://localhost:3000/api/v1/crime_states/${stateId}/most_dangerous_cities?crime=${crime}&limit=5`,
    success: function(data) {
      $(".dangerousCitiesList").empty()
      data.most_dangerous_cities.forEach(function(city) {
        let rowWithName = `<li class=${city.name} id=${city.id}>City: ${city.name}</li>`
        let rowWithCrime = identifyCrime(crime, city)
        let rowWithLink = `<a href=states/${stateId}/cities/${city.id}>View More <br>`
        $(".dangerousCitiesList").append(rowWithName + rowWithCrime + rowWithLink)
    })
    }
  })
}

function fillSafestCities(crime) {
  let stateId = $(".myInfo").attr("id")
  $.ajax({
    type: "GET",
    url: `http://localhost:3000/api/v1/crime_states/${stateId}/safest_cities?crime=${crime}&limit=5`,
    success: function(data) {
      $(".safestCitiesList").empty()
      data.safest_cities.forEach(function(city) {
        let rowWithName = `<li class=${city.name} id=${city.id}>City: ${city.name}</li>`
        let rowWithCrime = identifyCrime(crime, city)
        let rowWithLink = `<a href=states/${stateId}/cities/${city.id}>View More <br>`
        $(".safestCitiesList").append(rowWithName + rowWithCrime + rowWithLink)
    })
    }
  })
}

function crimeFilterListener() {
  $("#stateDropdown").on("click", function() {
    let crime = event.target.classList.value
    let crimeName = event.target.innerText
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
      return `<li class="crime">larceny_theft Theft Rate: ${city.larceny_theft_rate}</li>`
      break;
    case "motor_vehicle_theft":
      return `<li class="crime">Motor Vehicle Theft Rate: ${city.motor_vehicle_theft_rate}</li>`
      break;

  }
}

$(document).ready(function() {
  fillMostDangerousCities("violent_crime")
  fillSafestCities("violent_crime")
  crimeFilterListener()
})
