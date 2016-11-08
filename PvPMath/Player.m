//
//  Player.m
//  PvPMath
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        _score = 0;
        _lives = 3;
        _name = name;
    }
    return self;
}

@end
