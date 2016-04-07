//
//  MemoItem.h
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoItem : NSObject

@property (nonatomic, strong) NSString *memo;
@property (nonatomic, copy) NSArray *contents;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *itemKey;
@property (nonatomic, strong) NSString *groupKey;

- (instancetype) initInGroup:(NSString *)groupKey withMemo:(NSString *)memo;
- (instancetype) initInGroup:(NSString *)groupKey withMemo:(NSString *)memo andContentsOrNil:(NSArray *)contents;

@end
