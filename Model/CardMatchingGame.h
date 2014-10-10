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

@property (nonatomic, readonly)NSInteger score;

@end
