//
//  ViewController.m
//  Matchismo
//
//  Created by Alex on 10/8/14.
//  Copyright (c) 2014 Stanford. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) Deck *deck;
@end

@implementation ViewController



-(Deck *)deck {
    if (!_deck) _deck =[[PlayingCardDeck alloc]init];
    return _deck;}

- (IBAction)touchCardButton:(UIButton *)sender {

    if ([sender.currentTitle length]){
    
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        
        Card *card = [self.deck drawRandomCard];
        
        if (card)[sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]forState:UIControlStateNormal];
       [sender setTitle:[card contents] forState:UIControlStateNormal];
        
       
}
    self.flipCount++;
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flip count %d", self.flipCount);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
