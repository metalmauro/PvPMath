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
        NSLog(@"%@",players);
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

-(void)checkAnswer:(NSString*)input
{
    NSMutableArray *Playerscopy = [NSMutableArray arrayWithArray:self.players];
    int turn = self.turnCounter;
    Player *current = [self findCurrentPlayer:self.players];
    if(self.answer == [input integerValue])
    {
        [current increaseScore];
        self.question = @"Correct!";
    }else{
        [current decreaseLives];
        self.question = @"Incorrent";
    }
    [Playerscopy replaceObjectAtIndex:turn withObject:current];
    self.players = [NSMutableArray arrayWithArray:Playerscopy];
    [self.players addObject:current];
    [self update];
    if(turn == 1){
        self.turnCounter = 0;
    }else{
        self.turnCounter++;
    }
}
-(Player*)findCurrentPlayer:(NSMutableArray*)playerList
{
    int test = self.turnCounter;
    if(test == 0){
        return [playerList objectAtIndex:test];
    }else{
        return [playerList objectAtIndex:test];
    }
}

-(void)update
{
    for(int i = 0; i < [self.players count]; i++){
        Player *p = [self.players objectAtIndex:i];
        if([p.name isEqualToString:@"matt"]){
            self.p1Score = p.score;
            self.p1Lives = p.lives;
        }else{
            self.p1Lives = p.lives;
            self.p2Score = p.score;
        }
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
