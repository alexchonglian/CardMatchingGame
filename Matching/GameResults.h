//
//  GameResults.h
//  Matching
//
//  Created by Chong Lian on 3/20/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResults : NSObject

+ (NSArray *) allGameResults; // of GameResults

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;
@end
