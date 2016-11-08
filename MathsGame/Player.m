//
//  Player.m
//  MathsGame
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
        _score = 0;
        _lives = 3;
        _alive = YES;
    }
    return self;
}
-(void)increaseScore
{
    self.score++;
}
-(void)decreaseLives
{
    self.lives -=1;
}

@end
