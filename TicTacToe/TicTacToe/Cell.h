//
//  Cell.h
//  TicTacToe
//
//  Created by Ana Nogal on 07/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@interface Cell : NSObject

+ (instancetype)cellWithPosition:(struct Position)position andPlayer:(enum Player)player;

- (enum CellStatus)status;
- (BOOL)containsPosition:(struct Position)position;
- (void)addPlayer:(enum Player)player;

@end
