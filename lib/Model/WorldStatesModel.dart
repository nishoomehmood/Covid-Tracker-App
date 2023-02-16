class WorldStatesModel {
  WorldStatesModel({
     this.updated =0,
     this.cases = 0,
     this.todayCases =0,
     this.deaths = 0,
     this.todayDeaths = 0,
       this.recovered = 0,
       this.todayRecovered = 0,
     this.active = 0,
     this.critical = 0,
     this.casesPerOneMillion = 0,
     this.deathsPerOneMillion = 0,
     this.tests = 0,
     this.testsPerOneMillion = 0.0,
     this.population = 0,
     this.oneCasePerPeople = 0,
     this.oneDeathPerPeople = 0,
     this.oneTestPerPeople = 0,
     this.activePerOneMillion = 0.0,
     this.recoveredPerOneMillion = 0.0,
     this.criticalPerOneMillion = 0.0,
     this.affectedCountries = 0,});

  WorldStatesModel.fromJson(dynamic json) {
    updated = json['updated'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    late final casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
    affectedCountries = json['affectedCountries'];
  }
  late int updated;
  late int cases;
  late int todayCases;
  late int deaths;
  late int todayDeaths;
  late int recovered;
  late int todayRecovered;
  late int active;
  late int critical;
  late int casesPerOneMillion;
  late int deathsPerOneMillion;
  late int tests;
  late double testsPerOneMillion;
  late int population;
  late int oneCasePerPeople;
  late int oneDeathPerPeople;
  late int oneTestPerPeople;
  late double activePerOneMillion = 0.0;
  late double recoveredPerOneMillion;
  late double criticalPerOneMillion;
  late int affectedCountries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = updated;
    map['cases'] = cases;
    map['todayCases'] = todayCases;
    map['deaths'] = deaths;
    map['todayDeaths'] = todayDeaths;
    map['recovered'] = recovered;
    map['todayRecovered'] = todayRecovered;
    map['active'] = active;
    map['critical'] = critical;
    map['casesPerOneMillion'] = casesPerOneMillion;
    map['deathsPerOneMillion'] = deathsPerOneMillion;
    map['tests'] = tests;
    map['testsPerOneMillion'] = testsPerOneMillion;
    map['population'] = population;
    map['oneCasePerPeople'] = oneCasePerPeople;
    map['oneDeathPerPeople'] = oneDeathPerPeople;
    map['oneTestPerPeople'] = oneTestPerPeople;
    map['activePerOneMillion'] = activePerOneMillion;
    map['recoveredPerOneMillion'] = recoveredPerOneMillion;
    map['criticalPerOneMillion'] = criticalPerOneMillion;
    map['affectedCountries'] = affectedCountries;
    return map;
  }

}