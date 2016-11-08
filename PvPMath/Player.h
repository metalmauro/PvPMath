//
//  Player.h
//  PvPMath
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "GameManager.h"
#import <Foundation/Foundation.h>

@interface Player : NSObject <GamePlayer>
@property NSString *name;
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) NSInteger lives;

-(instancetype)initWithName:(NSString*)name;

@end
