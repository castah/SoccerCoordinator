//: Playground - noun: a place where people can play

import UIKit

// Player Collection

var players = [["Name" :"Hawer", "": 3],
    ["Name" :"Cristiano"],
    ["Name" :"Messi"],
    ["Name" :"Maradona"],
    ["Name" :"Pele"],
    ["Name" :"Zidane"],
    ["Name" :"Ronaldiño"]
]

// Team collection

var teams = [
    "Dragons": [[:]],
    "Sharks": [[:]],
    "Raptors": [[:]]
]

var maxPlayersByTeam = (players.count) / (teams.count)

func loadPlayersInTeam(teamName: String)
{
    // Create a temporal array to store player by team
    var team = [[String:AnyObject]]()
    var count = 0
    for i in 0..<maxPlayersByTeam {
        let player = players[i]
        team.append(player)
        count++
        players.removeAtIndex(i)
        
        // if team is loaded assign it to team collection
        if (count == maxPlayersByTeam)
        {
            teams[teamName] = team
            count = 0;
        }
    }
}

func configureTeams()
{
    for (key, _) in teams {
        loadPlayersInTeam(key)
    }

}

configureTeams()

print(teams["Dragons"])
print(teams["Sharks"])
print(teams["Raptors"])
