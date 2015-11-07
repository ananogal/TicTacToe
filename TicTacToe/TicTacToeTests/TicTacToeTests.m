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
    
    enum GameStatus status = [game playTurn:PlayerO];
    
    XCTAssertTrue(status == GameNotPlayed);
}

- (void)testPlayerXCanPlayFirst {
    
    enum GameStatus status = [game playTurn:PlayerX];
    
    XCTAssertTrue(status == GamePlayed);

}

- (void)testPlayersMustAlternate{
    [game playTurn:PlayerX];
    enum GameStatus status = [game playTurn:PlayerX];
    
    XCTAssertTrue(status == GameNotPlayed);
}
@end
