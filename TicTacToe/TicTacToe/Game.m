//
//  Game.m
//  TicTacToe
//
//  Created by Ana Nogal on 02/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import "Game.h"

@interface Game ()

@property (nonatomic, assign) enum Player turnToPlay;
@end

@implementation Game

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.turnToPlay = PlayerX;
    }
    return self;
}

- (enum GameStatus)playTurn:(enum Player)player {
    
    if(self.turnToPlay == player) {
        self.turnToPlay = self.turnToPlay == PlayerX ? PlayerO : PlayerX;
        return GamePlayed;
    }
    return GameNotPlayed;
}
@end
