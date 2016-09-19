//: Playground - noun: a place where people can play

import UIKit

// Player Collection

var players = [
    ["name" :"Joe Smith", "height": 42, "SE": true, "guardians": "Jim and Jan Smith"],
    ["name" :"Jill Tanner", "height": 36, "SE": true, "guardians": "Clara Tanner"],
    ["name" :"Bill Bon", "height": 43, "SE": true, "guardians": "Sara and Jenny Bon"],
    ["name" :"Eva Gordon", "height": 45, "SE": false, "guardians": "Wendy and Mike Gordon"],
    ["name" :"Matt Gill", "height": 40, "SE": false, "guardians": "Charles and Sylvia Gill"],
    ["name" :"Kimmy Stein", "height": 41, "SE": false, "guardians": "Bill and Hillary Stein"],
    ["name" :"Sammy Adams", "height": 45, "SE": false, "guardians": "Jeff Adams"],
    ["name" :"Karl Saygan", "height": 42, "SE": true, "guardians": "Heather Bledsoe"],
    ["name" :"Suzane Greenberg", "height": 44, "SE": true, "guardians": "Henrietta Dumas"],
    ["name" :"Sal Dali", "height": 41, "SE": false, "guardians": "Gala Dali"],
    ["name" :"Joe Kavaier", "height": 39, "SE": false, "guardians": "Sams and Elain Kavalier"],
    ["name" :"Ben Finkelstein", "height": 44, "SE": false, "guardians": "Aaron and Jill Finkelstein"],
    ["name" :"Diego Soto", "height": 42, "SE": true, "guardians": "Robin and Sarika Soto"],
    ["name" :"Chloe Alaska", "height": 47, "SE": false, "guardians": "David and Jaime Alaska"],
    ["name" :"Arnold Willis", "height": 43, "SE": false, "guardians": "Claire Wills"],
    ["name" :"Philip Helm", "height": 44, "SE": true, "guardians": "Thomas Helm and Eva Jones"],
    ["name" :"Les Clay", "height": 42, "SE": true, "guardians": "Wynonna Brown"],
    ["name" :"Herschel Krustofski", "height": 45, "SE": true, "guardians": "Hyman and Rachel Krustofski"]
]

// Team collection

var teams: [[String : NSObject]] = [
    ["name": "Dragons", "practiceDate": "March 17, 1pm"],
   ["name": "Sharks", "practiceDate": "March 17, 3pm"],
   ["name": "Raptors", "practiceDate": "March 18, 1pm"]
]

var maxPlayersByTeam = (players.count) / (teams.count)

func loadPlayersInTeam(var team: [String: NSObject]) -> [String: NSObject]
{
    // Create a temporal array to store player by team
    var teamPlayers = [[String:AnyObject]]()
    var count = 0
    
    for i in 0..<maxPlayersByTeam {
        
        let player = players[i]
        teamPlayers.append(player as [String : AnyObject])
        count += 1

        // if team is loaded assign it to team collection
        if (count == maxPlayersByTeam)
        {
            team["players"] = teamPlayers
            count = 0;
        }
        
        // Emptying players until the last six players
        if (players.count > maxPlayersByTeam) {
            players.removeAtIndex(i)
        }
    }
    
    return team
}

func configureTeams()
{
   for i in 0..<teams.count
   {
        let team = teams[i]
        let newTeam = loadPlayersInTeam(team)
        teams[i] = newTeam
   }
}

configureTeams()

func printLetters()
{
    for team in teams
    {
        var letter: String = ""
        letter += "---------------------------------------------------------------- \n"
        letter = "Team name: \(team["name"]) \n \n"
        let playersOfTheTeam = team["players"] as! NSArray
        for player in playersOfTheTeam
        {
            letter += "player name: \(player["name"]) \n"
        }
        
        letter += "Practice date: \(team["practiceDate"]) \n \n"
        
        letter += "---------------------------------------------------------------- \n"
        
        print(letter)
    }
}

printLetters()
