// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Fun {
   
    // from 0 to 4, 
    // 0 - "NO GOD! PLEASE NO!!! NOOOOOOOOOO", 
    // 1 - ** starts talking in Irish accent ** "They might take our lives, but their will never take our FREEDOM!!"
    // 2 - "meh"
    // 3 - "sure, but you are paying", 
    // 4 - "fuck yeah"

    struct Preference {
        bytes32 activity;
        uint8 disposition; 
    }

    struct Attractiveness {
        address to;
        uint8 disposition; //u get it
    }

    struct Event {
        bytes32 activity;
        address person1
        address person2
    }

    mapping(address => Preference[]) public eventPreferences; 
    mapping(address => Attractiveness[]) public peopleAttractiveness;
    Event[] public meetings

    constructor() {
    }
    
    function inviteOnDate(address with, bytes32 activity) {
        Attractiveness[] storage targetAttractiveness = peopleAttractiveness[with]
        Preference[] storage targetActivityPreference = eventPreferences[with]
        uint attractiveness = 0
        uint activityPreference = 0

        for (uint i = 0; i < targetActivityPreference.length; i++) {
            if(targetActivityPreference[i].activity === activity) {
                activityPreference = targetActivityPreference[i].disposition;
            }
        }

        for (uint i = 0; i < targetAttractiveness.length; i++) {
            if(targetAttractiveness[i].to === msg.sender) {
                attractiveness = targetAttractiveness[i].disposition;
            }
        }

        require(attractiveness.disposition > 2, "Try not to suck so much next time")
        require(activityPreference > 2, "Ughh - boring")
        
        meetings.push(Event(activity, msg.sender, with));
    }

}
