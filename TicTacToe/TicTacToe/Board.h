//
//  Board.h
//  TicTacToe
//
//  Created by Ana Nogal on 08/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@interface Board : NSObject

- (enum GameStatus)canPlayer:(enum Player)player playForPosition:(struct Position) position;

- (enum BoardStatus)hasWinningPlayer:(enum Player)player;
- (enum BoardStatus)isFull;

@end
