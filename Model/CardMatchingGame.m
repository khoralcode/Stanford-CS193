//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Alex on 10/9/14.
//  Copyright (c) 2014 Stanford. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite)NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //ofcards
@property (nonatomic) int gameMode; // Y for 2 N for 3 card match game
@property (nonatomic) NSString *pickResult;

@end


@implementation CardMatchingGame



- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount: (NSUInteger)count usingDeck: (Deck *) deck;
{
    self = [super init];
    
    if (self){
             for (int i = 0; i< count; i++){
    Card *card = [deck drawRandomCard];
        if (card)
        {[self.cards addObject:card];
             }else{
        self =nil;
            break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex: (NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSLog(@"card is %@", [card contents ]);
   
    
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
        }else{
                            // match against other card (or wait till 2nd card is flipped, before begining match evaluation)"if fliped card count <X, do nothing, else eval (aka run code below). That way you can make game mode as many cards as you want by changing the var X
            for (Card *otherCard in self.cards){
                _pickResult = [NSString stringWithFormat:@"%@", [card contents]];
                
                
                if (otherCard.isChosen && !otherCard.isMatched){
   
                    int matchScore = [card match:@[otherCard]];
                     
                    if (matchScore){
                        _pickResult = [NSString stringWithFormat:@"%@ & %@ is a match, %i points!",[otherCard contents],[card contents], MATCH_BONUS];
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched =YES;
                
                    }else {_pickResult = [NSString stringWithFormat:@"%@ & %@ NO match, 2pt penalty", [otherCard contents],[card contents]];
                        self.score -= MISMATCH_PENALTY;
                    //card.chosen = NO;
                        otherCard.chosen = NO;
                    }
                break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
    }
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count])?
    self.cards [index]:nil;
 }

-(int) gameMode
{
    return _gameMode;
}

-(void) resetGame
{
    
    for (Card *otherCard in self.cards){
        if (otherCard.isChosen || otherCard.isMatched){
                otherCard.matched =NO;
            otherCard.chosen =NO;
               self.score =0;
       
  }
   
}
}
-(instancetype)init
{
        return nil;
}


@end
