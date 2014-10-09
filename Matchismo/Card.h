//
//  Card.h
//  CardGame
//
//  Created by Alex on 10/7/14.
//  Copyright (c) 2014 Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen)BOOL chosen;
@property (nonatomic, getter=isMatched)BOOL matched;

-(int)match:(NSArray *)otherCards;


@end
