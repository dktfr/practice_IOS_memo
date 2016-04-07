//
//  GroupItem.h
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 6..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) NSString *groupKey;
@property (nonatomic, readonly) NSInteger numberOfItems;

- (instancetype) initWithTitle:(NSString *)title;

@end
