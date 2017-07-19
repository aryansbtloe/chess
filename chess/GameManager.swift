//
//  GameManager.swift
//  chess
//
//  Created by Orahi on 19/07/17.
//  Copyright © 2017 Orahi. All rights reserved.
//

import UIKit

func Gm()->GameManager{
    return GameManager.sharedInstance
}

class GameManager: NSObject {
    static let sharedInstance : GameManager = {
        let instance = GameManager()
        return instance
    }()
    
    var configuration : Configuration?
    var rules : GameRules?
    var board : Board?
    
    func beginNewGame(){
        configuration = Configuration()
        rules = GameRules()
        board = Board()
        
        //To Do : 
        //add pieces to board in according to new game
        //1: create add 8 white/8 black pawns and add it to board.pieces array
        //2: create add 2 white/8 black pawns and add it to board.pieces array
    }
    
    func getPossibleDirectionsFor(piece:Piece)->[Int]{
        var directions : [Int] = []
        
        //step 1: fetch movement rules for the piece
        let mRules = rules!.getMoveMentRulesForPiece(piece: piece)
        
        //step 2: generate possible moves based upon movement rules
        for r in mRules {
            switch r {
            case movements.aStepForward:
                
                //step 2.1
                //add a step forward possible position in directions array
                let cpos = piece.position
                let possiblePosition = cpos + 8
                directions.append(possiblePosition)
                break

            case movements.aStepBackward:
                
                //step 2.1
                //add a step backward possible position in directions array
                let cpos = piece.position
                let possiblePosition = cpos - 8
                directions.append(possiblePosition)
                break

            default:
                break
            }
        }
        
        //step 3: filterout invalid moves
        directions.filter { (position) -> Bool in
            
            //step 3.1 , check if is legal position
            if position > self.configuration!.totalPositions - 1 || position < 0 {
                return false
            }
            
            //step 3.2 , check if another piece exist of same party
            if isPieceOfSamePartyExistAt(piece: piece, position: position) {
                return false
            }
            
            return true
        }
        
        //step 4: return the valid moves
        return directions
    }

    func isPieceOfSamePartyExistAt(piece:Piece,position:Int)->Bool{
        for p in board!.pieces {
            if p.position == position && p.isWhite == piece.isWhite {
                return true
            }
        }
        return false
    }
}
