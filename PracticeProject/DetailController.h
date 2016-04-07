//
//  DetailControllerViewController.h
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MemoItem;

@interface DetailController : UIViewController

@property (nonatomic, strong) MemoItem *currentItem;
@property (nonatomic, weak) IBOutlet UITextView *memoField;

- (void)onCancelClicked;
- (void)onDoneClicked;

@end
