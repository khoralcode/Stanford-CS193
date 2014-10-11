//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Alex on 10/9/14.
//  Copyright (c) 2014 Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject


//designated inititializer

-(instancetype)initWithCardCount: (NSUInteger)count usingDeck: (Deck *) deck;

- (void) chooseCardAtIndex: (NSUInteger)index;
-(Card *) cardAtIndex:(NSUInteger)index;
-(void) resetGame;
-(int) gameMode;// "0" for 2 card match, "1" for 3 card match
@property (nonatomic, readonly)NSInteger score;


@end
