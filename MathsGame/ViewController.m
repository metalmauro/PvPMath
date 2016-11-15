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
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;
@property (weak, nonatomic) IBOutlet UIButton *EnterAnswerButton;
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
    self.GameThread.text = self.gm.question;
    self.hintLabel.text = [self hintLabeltext];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    GameManager *gm = [[GameManager alloc]init];
    self.gm = gm;
    self.userInput = [NSMutableArray new];
    self.P1Score.text = [NSString stringWithFormat:@"%ld",[self.gm p1Score]];
    self.P2Score.text = [NSString stringWithFormat:@"%ld",[self.gm p2Score]];
    self.P1Lives.text = [NSString stringWithFormat:@"%ld",[self.gm p1Lives]];
    self.P2Lives.text = [NSString stringWithFormat:@"%ld",[self.gm p2Lives]];
    self.GameThread.text = self.gm.question;
    self.hintLabel.text = [self hintLabeltext];
}

-(NSString*)hintLabeltext
{
    if([self.GameThread.text isEqualToString:@"Game Start"])
    {
        return @"Hit Enter Button to begin";
    }if ([self.GameThread.text isEqualToString:@"GAME OVER!"]) {
        return @"Hit Enter to Start a new game";
    } else {
        NSArray *array = [NSArray arrayWithArray:self.userInput];
        return [[array valueForKey:@"description"] componentsJoinedByString:@""];
    }
}

- (IBAction)Button1:(id)sender {
    [self.userInput addObject:@"1"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button2:(id)sender {
    [self.userInput addObject:@"2"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button3:(id)sender {
    [self.userInput addObject:@"3"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button4:(id)sender {
    [self.userInput addObject:@"4"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button5:(id)sender {
    [self.userInput addObject:@"5"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button6:(id)sender {
    [self.userInput addObject:@"6"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button7:(id)sender {
    [self.userInput addObject:@"7"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button8:(id)sender {
    [self.userInput addObject:@"8"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button9:(id)sender {
    [self.userInput addObject:@"9"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}
- (IBAction)Button0:(id)sender {
    [self.userInput addObject:@"0"];
    self.hintLabel.text = [self hintLabeltext];
    [self reloadView];
}

- (IBAction)EnterAnswerButton:(id)sender {
    
    if([self.GameThread.text isEqualToString:@"Game Start"]){
        [self.gm generateQuestion];
        [self reloadView];
    }else if([self.GameThread.text isEqualToString:@"GAME OVER!"]){
        [self.gm reset];
    }else{
        [self.gm checkAnswer:[self finalizeInput:self.userInput]];
        [self reloadView];
        [self.gm generateQuestion];
        [self performSelector:@selector(reloadView)
                   withObject:self
                   afterDelay:3.0];
    }
    [self.userInput removeAllObjects];
}




@end
