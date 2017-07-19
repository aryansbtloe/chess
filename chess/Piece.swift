//
//  Piece.swift
//  chess
//
//  Created by Orahi on 19/07/17.
//  Copyright © 2017 Orahi. All rights reserved.
//

import UIKit

enum PieceType {
    case pawn
    case knight
    case king
    case queen
    case elephant
    case horse
}

class Piece: NSObject {

    var type : PieceType = .pawn
    var position = 1
    var isWhite = true

}

