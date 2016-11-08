//
//  GameManager.h
//  PvPMath
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GamePlayer <NSObject>
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger lives;
@property NSString *name;

@end

@interface GameManager : NSObject
@property id<GamePlayer> player1;
@property id<GamePlayer> player2;
@property (nonatomic, readwrite) NSInteger turnCounter;
@property NSString *question;
@property NSInteger answer;

-(id<GamePlayer>)whosTurn;
-(BOOL)confirmAnswer:(NSString*)answer ofPlayer:(id<GamePlayer>) player;
-(NSString*)generateQuestion:(id<GamePlayer>) player;

@end
