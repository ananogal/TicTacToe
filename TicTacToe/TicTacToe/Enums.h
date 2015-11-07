//
//  Enums.h
//  TicTacToe
//
//  Created by Ana Nogal on 02/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

enum GameStatus {
    GamePlayed,
    GameNotPlayed
};

enum Player {
    PlayerX,
    PlayerO,
    None
};

enum CellStatus {
    CellEmpty,
    CellFull
};

struct Position {
    NSInteger x;
    NSInteger y;
};

static inline struct Position PositionMake(NSInteger x, NSInteger y) {
    struct Position position;
    position.x = x;
    position.y = y;
    
    return position;
}

static inline BOOL PositionsAreEqual(struct Position positionLeft, struct Position positionRight) {
    return positionLeft.x == positionRight.x && positionLeft.y == positionRight.y;
}
