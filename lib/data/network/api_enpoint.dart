 class ApiEnPoint{

   static const String countryApi="https://restcountries.com/v3.1/all";
   static  String searchByCountryName(String name)=>"https://restcountries.com/v3.1/name/$name";
   static  String countriesOfContinent(String continentName)=>"https://restcountries.com/v3.1/region/$continentName";

}