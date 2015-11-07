//
//  Game.h
//  TicTacToe
//
//  Created by Ana Nogal on 02/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@interface Game : NSObject

- (enum GameStatus)playTurn:(enum Player)player forPosition:(struct Position)position;
@end
