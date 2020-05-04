//
//  Entry.h
//  JournalObjectiveC
//
//  Created by Bryce Bradshaw on 5/4/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;


@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;

@end

NS_ASSUME_NONNULL_END
