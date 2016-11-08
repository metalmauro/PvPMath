//
//  GameManager.m
//  PvPMath
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "GameManager.h"
#import "Player.h"

@implementation GameManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _turnCounter = 1;
        _answer = 0;
        _question = [self generateQuestion:[self whosTurn]];
        Player *pOne = [[Player alloc]initWithName:@"Player1"];
        Player *pTwo = [[Player alloc]initWithName:@"Player2"];
        _player1 = pOne;
        _player2 = pTwo;
    }
    return self;
}

-(id<GamePlayer>)whosTurn
{
    if(self.turnCounter == 1)
    {
        self.turnCounter++;
        return self.player1;
    }else{
        self.turnCounter = 1;
        return self.player2;
    }
}

-(NSString*)findName
{
    return [self whosTurn].name;
}

-(NSString*)generateQuestion:(id<GamePlayer>) player
{
    int x = arc4random_uniform(99)+1;
    int y = arc4random_uniform(99)+1;
    self.answer = x+y;
    NSString *output = [NSString stringWithFormat:@"%@, What is %d + %d", [self findName], x, y];
    return output;
}

-(BOOL)confirmAnswer:(NSString*)answer ofPlayer:(id<GamePlayer>) player
{
    if([answer integerValue]==self.answer){
        player.score++;
        return YES;
    }
    player.lives-=1;
    return NO;
}

@end
