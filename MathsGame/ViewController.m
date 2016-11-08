//
//  ViewController.m
//  MathsGame
//
//  Created by Matthew Mauro on 2016-11-07.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "GameManager.h"
#import "Player.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *P2Score;
@property (weak, nonatomic) IBOutlet UILabel *P1Score;
@property (weak, nonatomic) IBOutlet UILabel *P1Lives;
@property (weak, nonatomic) IBOutlet UILabel *P2Lives;
@property (weak, nonatomic) IBOutlet UILabel *GameThread;

@property NSMutableArray *userInput;
@property (strong, nonatomic) GameManager *gm;

@end

@implementation ViewController

-(NSString*)finalizeInput:(NSArray*)array
{
    array = [NSArray arrayWithArray:self.userInput];
    return [[array valueForKey:@"description"] componentsJoinedByString:@""];
}

-(void)reloadView{
    self.P1Score.text = [NSString stringWithFormat:@"%ld",[self.gm p1Score]];
    self.P2Score.text = [NSString stringWithFormat:@"%ld",[self.gm p2Score]];
    self.P1Lives.text = [NSString stringWithFormat:@"%ld",[self.gm p1Lives]];
    self.P2Lives.text = [NSString stringWithFormat:@"%ld",[self.gm p2Lives]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    GameManager *gm = [[GameManager alloc]init];
    self.userInput = [NSMutableArray new];
    self.P1Score.text = [NSString stringWithFormat:@"%ld",[self.gm p1Score]];
    self.P2Score.text = [NSString stringWithFormat:@"%ld",[self.gm p2Score]];
    self.P1Lives.text = [NSString stringWithFormat:@"%ld",[self.gm p1Lives]];
    self.P2Lives.text = [NSString stringWithFormat:@"%ld",[self.gm p2Lives]];
    self.GameThread.text = self.gm.question;
    [self.gm generateQuestion];
}

- (IBAction)Button1:(id)sender {
    [self.userInput addObject:@"1"];
}
- (IBAction)Button2:(id)sender {
    [self.userInput addObject:@"2"];
}
- (IBAction)Button3:(id)sender {
    [self.userInput addObject:@"3"];
}
- (IBAction)Button4:(id)sender {
    [self.userInput addObject:@"4"];
}
- (IBAction)Button5:(id)sender {
    [self.userInput addObject:@"5"];
}
- (IBAction)Button6:(id)sender {
    [self.userInput addObject:@"6"];
}
- (IBAction)Button7:(id)sender {
    [self.userInput addObject:@"7"];
}
- (IBAction)Button8:(id)sender {
    [self.userInput addObject:@"8"];
}
- (IBAction)Button9:(id)sender {
    [self.userInput addObject:@"9"];
}
- (IBAction)Button0:(id)sender {
    [self.userInput addObject:@"0"];
}

- (IBAction)EnterAnswerButton:(id)sender {
    [self.gm checkAnswer:[self finalizeInput:self.userInput]];
    
}




@end
