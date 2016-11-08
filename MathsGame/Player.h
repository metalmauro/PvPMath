//
//  Player.h
//  MathsGame
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property NSString *name;
@property NSInteger score;
@property NSInteger lives;
@property BOOL alive;

-(instancetype)initWithName:(NSString*)name;
-(void)increaseScore;
-(void)decreaseLives;

@end
