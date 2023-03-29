//SPDX-License-Identifier:MIT
pragma solidity 0.8.10;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }


    mapping(uint256=>City) public cities; //mapping city Id with the City struct - cityId should be uint256
    mapping(address=>bool) hasVoted; //mapping to check if the address/account has voted or not

    modifier voted(){
        require(hasVoted[msg.sender]==false,"Already voted");
        _;
    }

    address owner;
    uint256 public cityCount = 0; // number of city added
        constructor() public {
        
        //TODO set contract caller as owner
        //TODO set some intitial cities.
            owner = msg.sender;
            addCity("Lalitpur");
            addCity("Kathmandu");
            addCity("Bhaktapur");
        }
    
 
 
    function addCity(string memory _cityName) public {
      //  TODO: add city to the CityStruct
      cityCount++;
      cities[cityCount] = City(_cityName,0);
    }
    
    function voteCity(uint256 _cityId) public voted{
        //TODO Vote the selected city through cityID
        cities[_cityId].vote++;
        hasVoted[msg.sender] = true;

    }

    function getCity(uint256 _cityId) public view returns (string memory) {
     // TODO get the city details through cityID
     return cities[_cityId].cityName;
    }

    function getVote(uint256 _cityId) public view returns (uint256) {
    // TODO get the vote of the city with its ID
        return cities[_cityId].vote;
    }
}