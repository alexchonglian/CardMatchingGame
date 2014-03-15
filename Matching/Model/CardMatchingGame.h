//
//  CardMatchingGame.h
//  Matching
//
//  Created by Chong Lian on 3/15/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id) initWithCardCount: (NSUInteger) cardCount
               usingDeck: (Deck *) deck;

- (void) flipCardAtIndex: (NSUInteger) index;

- (Card *) cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) int score;

@end
