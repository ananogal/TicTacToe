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

- (void)testGameStartsAlwaysWithPlayerX {
    Game* game = [Game new];
    
    enum GameStatus status = [game playTurn:PlayerO];
    
    XCTAssertTrue(status == GameNotPlayed);
}
@end
