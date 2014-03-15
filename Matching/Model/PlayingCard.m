//
//  PlayingCard.m
//  Matching
//
//  Created by Chong Lian on 3/15/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards {
    int score = 0;
    
    if (otherCards.count == 1) {
        id otherCard = [otherCards lastObject];
        if ([otherCard isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherPlayingCard = (PlayingCard *) otherCard;
            if ([otherPlayingCard.suit isEqualToString:self.suit]) {
                score = 1;
            } else if (otherPlayingCard.rank == self.rank) {
                score = 4;
            }
        }
    } 
    return score;
}


- (NSString *) contents {
    NSArray *rankString = [PlayingCard rankStrings];
    return [rankString [self.rank] stringByAppendingString:self.suit];
}


@synthesize suit = _suit; // because we provide setter and getter


+ (NSArray *) validSuits {
    return @[@"♥", @"♦", @"♠", @"♣"];
}


- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


- (NSString *) suit {
    return _suit ? _suit: @"?";
}


+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}


+ (NSUInteger) maxRank {return [self rankStrings].count - 1; }


- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
