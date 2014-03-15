//
//  Deck.h
//  Matching
//
//  Created by Chong Lian on 3/15/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *) card atTop:(BOOL) atTop;
- (Card *) drawRandomCard;

@end
