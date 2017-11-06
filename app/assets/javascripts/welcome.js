//= require_tree .

function populatedChartsListener() {
  $(".stateSelector").on("click", function(){
    fillDisplayCities(this.id)
    fillDisplayReports(this.id)
    fillCitiesDropdown(this.id)
  })
}

function currentCityListener() {
  $(".citiesSelector").on("click", function(){
    let cityId = this.id
    let stateId = $(".currentState").children().attr("id")
    fillDisplayPieCrimes(stateId, cityId)
  })
}

function fillDisplayCities(stateId) {
  $.ajax({
    type: "GET",
    url: `api/v1/${stateId}/display_cities?limit=10`,
    success: function(data) {
      $("#citiesContainer").empty()
      var svg = dimple.newSvg("#citiesContainer", 350, 350);
      var cities = []
      data.forEach(function(city) {
        cities.push({ "City":`${city.name}`, "Population":city.population })
      })
      var myChart = new dimple.chart(svg, cities);
      myChart.setBounds(55, 20, 300, 172)
      var x = myChart.addCategoryAxis("x", "City");
      x.addOrderRule("Date");
      myChart.addMeasureAxis("y", "Population");
      myChart.addSeries(null, dimple.plot.bar);
      myChart.draw();
    }
  })
}

function fillDisplayReports(stateId) {
  $.ajax({
    type: "GET",
    url: `api/v1/${stateId}/display_reports`,
    success: function(data) {
      $("#reportsContainer").empty()
      var svg = dimple.newSvg("#reportsContainer", 350, 350);
      var months = []
      let stateName = data[0].state;
      data.forEach(function(report) {
        months.push({ "Month/Year":`${report.month_year}`, "Weekly Earnings-Dollars":report.avg_weekly_earnings })
      })
      var myChart = new dimple.chart(svg, months);
      myChart.setBounds(55, 20, 300, 172)
      var x = myChart.addCategoryAxis("x", "Month/Year");
      x.addOrderRule("Date");
      var y = myChart.addMeasureAxis("y", "Weekly Earnings-Dollars");
      y.overrideMin = 400;
      myChart.addSeries(null, dimple.plot.bar);
      myChart.draw();
      $(".currentState").empty()
      $(".currentState").append(`<h3 class='currentState' id=${stateId}>${stateName}</h3>`)
      $.ajax({
        type: 'GET',
        url: `api/v1/crime_states/${stateId}/cities`,
        success: function(data) {
          $("#cityDropdown").empty()
          data.cities.forEach(function(city) {
            $("#cityDropdown").append(`<button id=${city.id} value=${city.state_id} style="border:none; background:none" class="citiesSelector"name=${city.name}>${city.name}</button><a href=states/${stateName}/cities/${city.id}>View More`)
            $("#cityDropdown").css({
              'background-color':'White',
              'background-repeat':'no-repeat',
              'cursor':'pointer',
              'overflow':'hidden',
              'font-family':'serif',
              'font-size':'12px',
              'color':'#52527a'
            })
          })
          currentCityListener()
        }
      })
    }
  })
}

function fillDisplayPieCrimes(stateId, cityId) {
  $.ajax({
    type: "GET",
    url: `api/v1/crime_states/${stateId}/cities/${cityId}`,
    success: function(data) {
      $("#pieCrimesContainer").empty()
      var svg = dimple.newSvg("#pieCrimesContainer", 590, 400);
      var crimes = []
      var cityName = data.name
      crimes.push({ "Crime": "Violent Crime", "Rate": data.violent_crime_rate})
      crimes.push({ "Crime": "Murder/Manslaughter", "Rate": data.murder_manslaughter_rate})
      crimes.push({ "Crime": "Rape", "Rate": data.rape_rate})
      crimes.push({ "Crime": "Robbery", "Rate": data.robbery_rate})
      crimes.push({ "Crime": "Aggrevated Assualt", "Rate": data.aggrevated_assault_rate})
      crimes.push({ "Crime": "Property Crime", "Rate": data.property_crime_rate})
      crimes.push({ "Crime": "Burglary", "Rate": data.burglary_rate})
      crimes.push({ "Crime": "Larceny Theft", "Rate": data.larceny_theft_rate})
      crimes.push({ "Crime": "Motor Vehicle Theft", "Rate": data.motor_vehicle_rate})
      var myChart = new dimple.chart(svg, crimes);
      myChart.setBounds(10, 10, 230, 180)
      myChart.addMeasureAxis("p", "Rate");
      myChart.addSeries("Crime", dimple.plot.pie);
      myChart.addLegend(250, 10, 45, 150, "left");
      myChart.draw();
      $(".currentCity").empty()
      $(".currentCity").append(`<h3 class='currentCity'>${cityName}</h3>`)
    }
  })
}

function fillNationalCrimeChart() {
  $.ajax({
    type: "GET",
    url: `api/v1/crime_years`,
    success: function(data) {
      let vc = []
      let mm = []
      let rp = []
      let rb = []
      let aa = []
      let pc = []
      let bg = []
      let lc = []
      let mvc = []
      data.forEach(function(year) {
        vc.push({"Year": year.year, "Violent Crime": year.violent_crime_rate})
        mm.push({"Year": year.year, "Murder/Manslaughter": year.murder_manslaughter_rate})
        rp.push({"Year": year.year, "Rape": year.rape_rate})
        rb.push({"Year": year.year, "Robbery": year.robbery_rate})
        aa.push({"Year": year.year, "Aggrevated Assault": year.aggrevated_assault_rate})
        pc.push({"Year": year.year, "Property Crime": year.property_crime_rate})
        bg.push({"Year": year.year, "Burglary": year.burglary_rate})
        lc.push({"Year": year.year, "Larceny Theft": year.larceny_theft_rate})
        mvc.push({"Year": year.year, "Motor Vehicle Theft": year.motor_vehicle_theft_rate})
      })
      let newData = {
        "Violent Crime": vc, "Murder/Manslaughter": mm, "Rape": rp, "Robbery": rb,
        "Aggrevated Assault": aa, "Property Crime": pc, "Burglary": bg,
        "Larceny Theft": lc, "Motor Vehicle Theft": mvc
      }
      crimeThroughTheYears(vc, "Violent Crime")
      nationalCrimeListener(newData)
    }
  })
}

function nationalCrimeListener(allData) {
  $("#nationalCrimeDropdown").click({allData}, function(data) {
    let crime = event.target.innerText
    let years = data.data.allData[crime]
    crimeThroughTheYears(years, crime)
    nationalCrimeListener(data.data.allData)
  })
}

function crimeThroughTheYears(data, crime) {
  $(`.nationalCrimeContainer`).empty()
  $(`.currentCrimeFilter`).empty()
  $(`.currentCrimeFilter`).append(crime)
  var svg = dimple.newSvg(`.nationalCrimeContainer`,  250, 250);
  var myChart = new dimple.chart(svg, data)
  myChart.setBounds(45, 15, 200, 150)
  var x = myChart.addCategoryAxis("x", "Year")
  x.addOrderRule("Date")
  myChart.addMeasureAxis("y", crime)
  var s = myChart.addSeries(null, dimple.plot.line)
  myChart.draw()
}

$(document).ready(function() {
  fillDisplayCities("6")
  fillDisplayReports("6")
  fillDisplayPieCrimes("6", "938")
  fillNationalCrimeChart()
  populatedChartsListener()
  currentCityListener()
})
