//
//  Board.m
//  TicTacToe
//
//  Created by Ana Nogal on 08/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import "Board.h"
#import "Cell.h"

@interface Board ()

@property (nonatomic, strong)NSMutableArray *grid;
@property (nonatomic, strong) NSArray *winningColumns;

@end

@implementation Board

static const int MAX_ROWS_COLUMNS = 3;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createGrid];
        [self createWinningColumns];
    }
    return self;
}

- (void)createGrid {
    self.grid = [NSMutableArray new];
    for (int i = 0; i < MAX_ROWS_COLUMNS; i++) {
        [self createRow: i + 1];
    }
}

- (void)createRow:(int)row {
    for (int i = 0; i < MAX_ROWS_COLUMNS; i++) {
        Cell *cell = [Cell cellWithPosition:PositionMake(row, i + 1 ) andPlayer:None];
        [self.grid addObject:cell];
    }
}

- (void)createWinningColumns {
    self.winningColumns = @[@[@0,@1,@2], @[@3,@4,@5], @[@6,@7,@8],
                            @[@0, @3, @6], @[@1, @4, @6], @[@2, @5, @8],
                            @[@0, @4, @8], @[@2, @4, @6]];
}

- (enum GameStatus)canPlayer:(enum Player)player playForPosition:(struct Position) position {

    for (int i = 0; i < [self.grid count]; i++) {
        Cell *cell = [self.grid objectAtIndex:i];
        if([cell containsPosition:position]) {
            if([cell isFilledWithPlayer:player] == CellEmpty) {
                [cell addPlayer:player];
                return GamePlayed;
            }
        }
    }
    
    return GameNotPlayed;
}

- (enum BoardStatus)hasWinningPlayer:(enum Player)player {
    
    for (NSArray* column in self.winningColumns) {
        int count = [self numberOfCellsFilledForPlayer:player inColumn:column];
        if(count == MAX_ROWS_COLUMNS) {
            return ColumnIsWinner;
        }
    }
    
    return ColumnIsEmpty;
}

- (int)numberOfCellsFilledForPlayer:(enum Player)player inColumn:(NSArray*)column {
    
    int count = 0;
    
    for (int i = 0; i < [column count]; i++) {
        int index = [[column objectAtIndex:i] intValue];
        Cell *cell = [self.grid objectAtIndex:index];
        if ([cell isFilledWithPlayer:player] == CellFilledWithPlayer) {
            count += 1;
        }
    }
    return count;
}

@end
