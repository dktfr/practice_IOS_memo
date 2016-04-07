//
//  MemoItemStore.m
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoItemStore.h"
#import "MemoItem.h"
#import "GroupItem.h"

@interface MemoItemStore ()

@property (nonatomic) NSMutableArray *innerItemsInGroup;
@property (nonatomic) NSMutableArray *innerGroups;

- (instancetype) initPrivate;

@end

@implementation MemoItemStore

// Accessor Mehod
- (NSArray *) groups
{
    return [_innerGroups copy];
}

- (NSArray *) itemsInGroup
{
    return [_innerItemsInGroup copy];
}

// Class Mehtod
+ (instancetype) sharedStore
{
    static MemoItemStore *sharedStore;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    return sharedStore;
}

// Initializer Method
- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Initialize Exception" reason:@"This is a singleton class. Use sharedStore class method instead." userInfo:nil];
}

- (instancetype) initPrivate
{
    self = [super init];
    if (self) {
        _innerItemsInGroup = [[NSMutableArray alloc] init];
    }
    return self;
}


- (GroupItem *)createGroup:(NSString *)title
{
    GroupItem *newGroup = [[GroupItem alloc] initWithTitle:title];
    [self.innerGroups addObject:newGroup];
    return newGroup;
}

#pragma mark - MemoItem CRUD Method

- (MemoItem *)createMemoItemInGroup:(NSString *)groupKey withMemo:(NSString *)memo andContentsOrNil:(NSArray *)contents
{
    MemoItem *newItem = [[MemoItem alloc] initInGroup:groupKey withMemo:memo andContentsOrNil:contents];
    [self.innerItemsInGroup addObject:newItem];
    return newItem;
}

- (void)deleteMemoItemAtIndex:(NSInteger)row
{
    [self.innerItemsInGroup removeObjectAtIndex:row];
}

- (void)deleteMemoItem:(MemoItem *)deleteItem
{
    [self.innerItemsInGroup removeObject:deleteItem];
}

@end
