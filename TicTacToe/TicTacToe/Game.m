//
//  Game.m
//  TicTacToe
//
//  Created by Ana Nogal on 02/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import "Game.h"
#import "Cell.h"
#import "Board.h"

@interface Game ()

@property (nonatomic, assign) enum Player turnToPlay;

@property (nonatomic, strong) Board *board;

@end

@implementation Game

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.turnToPlay = PlayerX;
        self.board = [Board new];
    }
    return self;
}

- (enum GameStatus)playTurn:(enum Player)player forPosition:(struct Position)position {
    if(self.turnToPlay == player) {
        enum GameStatus status = [self play:player forPosition:position];
        if (status == GamePlayed) {
            if([self.board hasWinningPlayer:player] == ColumnIsWinner) {
                status  = GameWinned;
            }
            
            if([self.board isFull] == BoardIsFull) {
                status = GameTied;
            }
            
            self.turnToPlay = self.turnToPlay == PlayerX ? PlayerO : PlayerX;
        }
        
        return status;
    }
    
    return GameNotPlayed;
}


- (enum GameStatus)play:(enum Player)player forPosition:(struct Position) position {
    
    enum GameStatus status = [self.board canPlayer:player playForPosition:position];
    
    return status;
}

@end
