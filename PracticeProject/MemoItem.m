//
//  MemoItem.m
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import "MemoItem.h"

@implementation MemoItem

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Initialize Exception" reason:@"You must use initTile:andMemo initalizer" userInfo:nil];
}

- (instancetype) initInGroup:(NSString *)groupKey withMemo:(NSString *)memo
{
    return [self initInGroup:groupKey withMemo:memo andContentsOrNil:nil];
}

- (instancetype) initInGroup:(NSString *)groupKey withMemo:(NSString *)memo andContentsOrNil:(NSArray *)contents
{
    self = [super init];
    if (self) {
        _memo = memo;
        _contents = contents;
        _date = [[NSDate alloc] init];
        _groupKey = groupKey;
        NSUUID *uuidGenerator = [[NSUUID alloc] init];
        _itemKey = [uuidGenerator UUIDString];
    }
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"{memo:%@,contents:%@,itemKey:%@}",self.memo, self.contents, self.itemKey];
}

@end
