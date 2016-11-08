//
//  GameManager.m
//  MathsGame
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "GameManager.h"
@implementation GameManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *players =  @[[[Player alloc]initWithName:@"matt"],
                              [[Player alloc]initWithName:@"Jen"]];
        _players = [NSMutableArray arrayWithArray:players];
        _answer = 0;
        _question = @"Game Start";
        _turnCounter = 0;
        _p1Score = 0;
        _p2Score = 0;
        _p1Lives = [self findLives:[self findCurrentPlayer:self.players]];
        _p2Lives = [self findLives:[self findCurrentPlayer:self.players]];
    }
    return self;
}

-(NSString*)generateQuestion
{
    Player *player = [self findCurrentPlayer:self.players];
    int x = arc4random_uniform(99)+1;
    int y = arc4random_uniform(99)+1;
    self.answer = x+y;
    NSString *output = [NSString stringWithFormat:@"%@, What is %d + %d", player.name, x, y];
    self.question = output;
    return output;
}
-(NSInteger)findLives:(Player*)current
{
    return current.lives;
}
-(Player*)checkAnswer:(NSString*)input
{
    Player *current = [self findCurrentPlayer:self.players];
    if(self.answer == [input integerValue])
    {
        [current increaseScore];
        self.question = @"Correct!";
    }else{
        [current decreaseLives];
        self.question = @"Incorrent";
    }
    return current;
}
-(Player*)findCurrentPlayer:(NSMutableArray*)playerList
{
    NSInteger test = self.turnCounter;
    if(test == 0){
        self.turnCounter = 1;
        return [playerList objectAtIndex:test];
    }else{
        self.turnCounter = 0;
        return [playerList objectAtIndex:test];
    }
}

-(void)reset
{
    NSArray *players =  @[[[Player alloc]initWithName:@"matt"],
                          [[Player alloc]initWithName:@"Jen"]];
    self.players = [NSMutableArray arrayWithArray:players];
    self.answer = 0;
    self.question = [NSString stringWithFormat:@"Game Start"];
    self.turnCounter = 0;
}


@end
