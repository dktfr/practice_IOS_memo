//
//  MemoItemStore.h
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GroupItem;
@class MemoItem;

@interface MemoItemStore : NSObject

@property (nonatomic, readonly) NSArray *groups;
@property (nonatomic, readonly) NSArray *itemsInGroup;

+ (instancetype) sharedStore;

- (GroupItem *)createGroup:(NSString *)title;

- (MemoItem *)createMemoItemInGroup:(NSString *)groupKey withMemo:(NSString *)memo andContentsOrNil:(NSArray *)contents;
- (void)deleteMemoItemAtIndex:(NSInteger)row;
- (void)deleteMemoItem:(MemoItem *)deleteItem;

@end
