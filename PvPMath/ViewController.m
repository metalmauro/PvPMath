//
//  ViewController.m
//  PvPMath
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "GameManager.h"
#import "Player.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *GameQuestion;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *Buttons;
@property (weak, nonatomic) IBOutlet UILabel *P2Score;
@property (weak, nonatomic) IBOutlet UILabel *P1Score;
@property (weak, nonatomic) IBOutlet UIButton *EnterButton;
@property GameManager *gm;
@property NSMutableArray *playerAnswer;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.playerAnswer = [NSMutableArray new];
    self.gm = [[GameManager alloc]init];
    [super viewDidLoad];
    [self.gm generateQuestion:(self.gm.player1)];
    self.GameQuestion.text = self.gm.question;
    [self.GameQuestion sizeToFit];
    self.P1Score.text = [NSString stringWithFormat:@"Player 1 Score: %ld", (long)[self.gm.player1 score]];
    [self.P1Score sizeToFit];
    self.P2Score.text = [NSString stringWithFormat:@"Player 2 Score: %ld", (long)[self.gm.player2 score]];
    [self.P2Score sizeToFit];
}

- (IBAction)whichButton:(id)sender {
    NSInteger whichButton = [self.Buttons indexOfObject:sender];
    switch (whichButton) {
        case 0:
            [self.playerAnswer addObject:@"1"];
        case 1:
            [self.playerAnswer addObject:@"2"];
        case 2:
            [self.playerAnswer addObject:@"3"];
        case 3:
            [self.playerAnswer addObject:@"4"];
        case 4:
            [self.playerAnswer addObject:@"5"];
        case 5:
            [self.playerAnswer addObject:@"6"];
        case 6:
            [self.playerAnswer addObject:@"7"];
        case 7:
            [self.playerAnswer addObject:@"8"];
        case 8:
            [self.playerAnswer addObject:@"9"];
        case 9:
            [self.playerAnswer addObject:@"0"];
    }
}
- (IBAction)confirmAnswer:(id)sender {
    NSString *result = [[self.playerAnswer valueForKey:@"description"] componentsJoinedByString:@""];
    if( [self.gm confirmAnswer:result ofPlayer:[self.gm whosTurn]] == TRUE)
    {
        self.GameQuestion.text = @"CORRECT!";
    }else{
        self.GameQuestion.text = @"FALSE!";
    }
}


@end
