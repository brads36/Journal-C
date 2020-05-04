//
//  Entry.m
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import "Entry.h"


static NSString * const TITLEKEY = @"title"; // created static constants
static NSString * const TEXTKEY = @"text"; // that are type String
static NSString * const TIMESTAMPKEY = @"timestamp";// these are the keynames for the dictionary

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self)
    {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TITLEKEY];
    NSString *text = dictionary[TEXTKEY];
    NSDate *timestamp = dictionary[TIMESTAMPKEY];
    return [self initWithTitle:title text:text timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TITLEKEY: self.title,
             TEXTKEY: self.text,
             TIMESTAMPKEY: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Entry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(Entry *)object dictionaryRepresentation]];
}

@end
