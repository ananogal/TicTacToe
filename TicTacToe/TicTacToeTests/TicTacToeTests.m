//
//  TicTacToeTests.m
//  TicTacToeTests
//
//  Created by Ana Nogal on 02/11/2015.
//  Copyright © 2015 Ana Nogal. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Game.h"
#import "Enums.h"

@interface TicTacToeTests : XCTestCase

@end

@implementation TicTacToeTests

Game* game;

- (void)setUp {
    [super setUp];
    
    game = [Game new];
}

- (void)testGameStartsAlwaysWithPlayerX {
    
    enum GameStatus status = [game playTurn:PlayerO forPosition: PositionMake(1, 1)];
    
    XCTAssertTrue(status == GameNotPlayed);
}

- (void)testPlayerXCanPlayFirst {
    
    enum GameStatus status = [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    
    XCTAssertTrue(status == GamePlayed);

}

- (void)testPlayersMustAlternate {
    
    [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    enum GameStatus status = [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    
    XCTAssertTrue(status == GameNotPlayed);
}

- (void)testPlayerPlaysForAPosition {
    enum GameStatus status = [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    
    XCTAssertTrue(status == GamePlayed);
}

- (void)testPlayerCantPlayInAFilledCell {

    [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    enum GameStatus status = [game playTurn:PlayerO forPosition: PositionMake(1, 1)];
    
    XCTAssertTrue(status == GameNotPlayed);
}

- (void)testIfPlayerCantPlayInACellStillisIsTurn {
    
    [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    [game playTurn:PlayerO forPosition: PositionMake(1, 1)];
    enum GameStatus status = [game playTurn:PlayerO forPosition: PositionMake(1, 2)];
    
    XCTAssertTrue(status == GamePlayed);
}

- (void)testPlayerWinsIfAColumnIsFilled {
    [game playTurn:PlayerX forPosition: PositionMake(1, 1)];
    [game playTurn:PlayerO forPosition: PositionMake(2, 1)];
    [game playTurn:PlayerX forPosition: PositionMake(1, 2)];
    [game playTurn:PlayerO forPosition: PositionMake(3, 1)];
    enum GameStatus status =  [game playTurn:PlayerX forPosition: PositionMake(1, 3)];
    XCTAssertTrue(status == GameWinned);
}

@end

