//
//  PlayingCard.m
//  CardGame
//
//  Created by Alex on 10/8/14.
//  Copyright (c) 2014 Stanford. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] != 0)// && gameMode is 2 card
    {
        if ([otherCards count] == 1) {
            PlayingCard *otherCard = [otherCards firstObject];
            if ([self.suit isEqualToString:otherCard.suit]) {
                return score = 1;
            } else if (self.rank == otherCard.rank)
            {
                return score = 4;
            }
        }
        else {
            for (Card *otherCard in otherCards) score += [self match:@[otherCard]];
            PlayingCard *otherCard = [otherCards firstObject];
            score += [otherCard match:[otherCards subarrayWithRange:NSMakeRange(1, [otherCards count] - 1)]];
        }
        /*
         else if ([otherCards count] == 2) {
         PlayingCard *otherCard = [otherCards firstObject];
         PlayingCard *secondCard = [otherCards objectAtIndex:2];
         if (([self.suit isEqualToString:otherCard.suit])&&([self.suit isEqualToString:secondCard.suit])) {
         return score = 3;
         } else if((self.rank == otherCard.rank)&&(self.rank == secondCard.rank))
         {
         return score = 12;
         }
         }
         else {
         for (Card *otherCard in otherCards) score += [self match:@[otherCard]];
         PlayingCard *otherCard = [otherCards firstObject];
         score += [otherCard match:[otherCards subarrayWithRange:NSMakeRange(1, [otherCards count] - 1)]];
         */
    }
    return score;
}

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return[rankStrings[self.rank]stringByAppendingString:self.suit];
}


@synthesize suit = _suit; //because we provide setter AND getter

+ (NSArray *) validSuits
{
      return @[@"♥️",@"♣️",@"♦️",@"♠️"];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    return@[@"?", @"A",@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",@"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {return [[self rankStrings]count]-1;}

-(void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank =rank;
    }
}
@end
