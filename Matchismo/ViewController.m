//
//  ViewController.m
//  Matchismo
//
//  Created by Alex on 10/8/14.
//  Copyright (c) 2014 Stanford. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *outcometext;
@property (weak, nonatomic) IBOutlet UISwitch *s2CardOr3Card;
@property (nonatomic) int gameMode;

@end

@implementation ViewController

-(IBAction)s2CardOr3Card:(id)sender 
{
    if (!sender) {_gameMode = 2;}
       else
       {_gameMode = 3;}
    
  
    
}

- (IBAction)resetButton:(UIButton *)sender
{
    
    for (UIButton *cardButton in self.cardButtons)
    {
    [cardButton setTitle:@"" forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[UIImage imageNamed: @"cardback"] forState:UIControlStateNormal];
     
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
        cardButton.enabled = YES;
        _outcometext.text = @"";
        if (self.game.score)
        { _s2CardOr3Card.enabled = YES;}
    }return [self.game resetGame];
}
- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}


-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}
-(void) updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
    self.outcometext.text = [NSString stringWithFormat:@"%@",self.game.pickResult];
    if (self.game.score)
        _s2CardOr3Card.enabled = NO;
   
}
-(UILabel *)outcometext:(NSString*)picResult
{
    _outcometext.text = picResult;
    return _outcometext;
}
-(NSString *)titleForCard:(Card *) card
{
    return card.isChosen ? card.contents:@"";
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront":@"cardback"];
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
