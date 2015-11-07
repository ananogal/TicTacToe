//
//  Game.m
//  TicTacToe
//
//  Created by Ana Nogal on 02/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import "Game.h"
#import "Cell.h"

@interface Game ()

@property (nonatomic, assign) enum Player turnToPlay;

@property (nonatomic, strong) NSMutableArray *board;
@end

@implementation Game

static const int MAX_ROWS = 3;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.turnToPlay = PlayerX;
        [self createBoard];
    }
    return self;
}

- (enum GameStatus)playTurn:(enum Player)player forPosition:(struct Position)position {
    
    if(self.turnToPlay == player) {
        enum GameStatus status = [self play:player forPosition:position];
        self.turnToPlay = self.turnToPlay == PlayerX ? PlayerO : PlayerX;
        return status;
    }
    
    return GameNotPlayed;
}

- (void)createBoard {
    self.board = [NSMutableArray new];
    for (int i = 0; i < MAX_ROWS; i++) {
        [self createRow: i + 1];
    }
}

-(void)createRow:(int)row {
    for (int i = 0; i < MAX_ROWS; i++) {
        Cell *cell = [Cell cellWithPosition:PositionMake(row, i + 1 ) andPlayer:None];
        [self.board addObject:cell];
    }
}

- (enum GameStatus)play:(enum Player)player forPosition:(struct Position) position {
    
    for (int i = 0; i < [self.board count]; i++) {
        Cell *cell = [self.board objectAtIndex:i];
        if([cell containsPosition:position]) {
            if([cell status] == CellEmpty) {
                [cell addPlayer:player];
                return GamePlayed;
            }
        }
    }
    
    return GameNotPlayed;
}

@end
