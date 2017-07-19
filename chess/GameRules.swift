//
//  GameRules.swift
//  chess
//
//  Created by Orahi on 19/07/17.
//  Copyright © 2017 Orahi. All rights reserved.
//

import UIKit

enum movements {
    case aStepLeft
    case aStepRight
    case aStepForward
    case aStepBackward
    case aStepUpperRight
    case aStepUpperLeft
    case aStepLowerRight
    case aStepLowerLeft
    case allTheWayLeft
    case allTheWayRight
    case allTheWayForward
    case allTheWayBackward
    case allTheWayRightDiagonal
    case allTheWayLeftDiagonal
    case twoAndHalfUpperRight
    case twoAndHalfUpperLeft
    case twoAndHalfLowerRight
    case twoAndHalfLowerLeft
}

class GameRules: NSObject {
    
    func getMoveMentRulesForPiece(piece:Piece)->[movements] {
        switch piece.type {
        case PieceType.pawn:
            return [
                movements.aStepForward,
                movements.aStepUpperRight,
                movements.aStepUpperLeft
            ]
            break
        case PieceType.knight:
            return [
                movements.allTheWayRightDiagonal,
                movements.allTheWayLeftDiagonal
            ]
            break
        case PieceType.king:
            return [
                movements.aStepLeft,
                movements.aStepRight,
                movements.aStepForward,
                movements.aStepBackward
            ]
            break
        case PieceType.queen:
            return [
                movements.allTheWayRightDiagonal,
                movements.allTheWayLeftDiagonal,
                movements.allTheWayLeft,
                movements.allTheWayRight,
                movements.allTheWayForward,
                movements.allTheWayBackward
            ]
            break
        case PieceType.elephant:
            return [
                movements.allTheWayLeft,
                movements.allTheWayRight,
                movements.allTheWayForward,
                movements.allTheWayBackward
            ]
            break
        case PieceType.horse:
            return [
                movements.twoAndHalfUpperRight,
                movements.twoAndHalfUpperLeft,
                movements.twoAndHalfLowerLeft,
                movements.twoAndHalfLowerRight
            ]
            break
        }
        return []
    }

}

