//
//  GroupItem.m
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 6..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import "GroupItem.h"

@implementation GroupItem

- (instancetype) initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _title = title;
        _numberOfItems = 0;
        NSUUID *uuidGenerator = [[NSUUID alloc] init];
        _groupKey = [uuidGenerator UUIDString];
    }
    return self;
}

@end
