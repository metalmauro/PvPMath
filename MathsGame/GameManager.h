//
//  GameManager.h
//  MathsGame
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "Player.h"
#import <Foundation/Foundation.h>

@interface GameManager : NSObject
@property NSMutableArray *players;
@property NSString *question;
@property NSInteger answer;
@property NSInteger p1Score;
@property NSInteger p2Score;
@property NSInteger p1Lives;
@property NSInteger p2Lives;
@property NSInteger turnCounter;

-(NSString*)generateQuestion;
-(void)reset;
-(void)checkAnswer:(NSString*)input;

@end
