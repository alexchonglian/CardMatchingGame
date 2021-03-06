//
//  GameResults.m
//  Matching
//
//  Created by Chong Lian on 3/20/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import "GameResults.h"

@interface GameResults ()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation GameResults

#define ALL_RESULTS_KEY @"GameResults_ALL"
#define START_KEY  @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"


+ (NSArray *) allGameResults {
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        GameResults *result = [[GameResults alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
}

- (id) initFromPropertyList: (id) plist{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionary = (NSDictionary *) plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
            if (!_start || !_end || !_score) {self = nil;}
        }
    }
    return self;
}

- (void) synchronize {
    NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) { mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init]; }
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey: ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (id) asPropertyList {
    return @{START_KEY: self.start, END_KEY: self.end, SCORE_KEY: @(self.score)};
}

// designated initializer
- (id) init {
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval) duration {
    return [self.end timeIntervalSinceDate:self.start];
}

- (void) setScore:(int)score {
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}

@end
