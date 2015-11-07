//
//  Cell.m
//  TicTacToe
//
//  Created by Ana Nogal on 07/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import "Cell.h"


@interface Cell ()

@property (nonatomic, assign)struct Position position;
@property (nonatomic, assign)enum Player player;

@end

@implementation Cell

+ (instancetype)cellWithPosition:(struct Position)position andPlayer:(enum Player)player {
    return [[self alloc] initWithPosition:position andPlayer:player];
}

- (instancetype)initWithPosition:(struct Position)position andPlayer:(enum Player)player
{
    self = [super init];
    if (self) {
        self.position = position;
        self.player = player;
    }
    
    return self;
}

- (BOOL)containsPosition:(struct Position)position {
    return PositionsAreEqual(self.position,  position);
}

- (enum CellStatus)status {
    if(self.player == None) {
        return CellEmpty;
    }
    
    return CellFull;
}

- (void)addPlayer:(enum Player)player {
    if([self status] == CellEmpty) {
        self.player = player;
    }
}


@end
