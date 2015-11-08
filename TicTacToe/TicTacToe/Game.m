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
@property (nonatomic, strong) NSArray *winningColumns;
@end

@implementation Game

static const int MAX_ROWS_COLUMNS = 3;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.turnToPlay = PlayerX;
        [self createBoard];
        [self createWinningColumns];
    }
    return self;
}

- (enum GameStatus)playTurn:(enum Player)player forPosition:(struct Position)position {
    if(self.turnToPlay == player) {
        enum GameStatus status = [self play:player forPosition:position];
        if (status == GamePlayed) {
            status = [self boardHasWinningColumnFullForPlayer:player];
            self.turnToPlay = self.turnToPlay == PlayerX ? PlayerO : PlayerX;
        }
        
        return status;
    }
    
    return GameNotPlayed;
}

- (void)createBoard {
    self.board = [NSMutableArray new];
    for (int i = 0; i < MAX_ROWS_COLUMNS; i++) {
        [self createRow: i + 1];
    }
}

- (void)createRow:(int)row {
    for (int i = 0; i < MAX_ROWS_COLUMNS; i++) {
        Cell *cell = [Cell cellWithPosition:PositionMake(row, i + 1 ) andPlayer:None];
        [self.board addObject:cell];
    }
}

- (void)createWinningColumns {
    self.winningColumns = @[@[@0,@1,@2], @[@3,@4,@5], @[@6,@7,@8],
                            @[@0, @3, @6], @[@1, @4, @6], @[@2, @5, @8],
                            @[@0, @4, @8], @[@2, @4, @6]];
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

- (enum GameStatus)boardHasWinningColumnFullForPlayer:(enum Player)player {
    
    for (NSArray* column in self.winningColumns) {
        int count = [self numberOfCellsFilledForPlayer:player inColumn:column];
        if(count == MAX_ROWS_COLUMNS) {
            return GameWinned;
        }
    }
    
    return GamePlayed;
}

- (int)numberOfCellsFilledForPlayer:(enum Player)player inColumn:(NSArray*)column {

    int count = 0;
    
    for (int i = 0; i < [column count]; i++) {
        int index = [[column objectAtIndex:i] intValue];
        Cell *cell = [self.board objectAtIndex:index];
        if ([cell isFilledWithPlayer:player] == CellFilled) {
            count += 1;
        }
    }
    return count;
}

@end
