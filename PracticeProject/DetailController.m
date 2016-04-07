//
//  DetailControllerViewController.m
//  PracticeProject
//
//  Created by NHNEnt on 2016. 4. 1..
//  Copyright © 2016년 NHNEnt. All rights reserved.
//

#import "DetailController.h"
#import "MemoItem.h"
#import "MemoItemStore.h"

@interface DetailController ()

@property (nonatomic) BOOL isModalController;

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Detail - %@", self.currentItem);
    if(_currentItem) {
        // 현재 아이템이 있으므로 셀렉트된 디테일뷰
        self.memoField.text = _currentItem.memo;
        self.isModalController = NO;
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancelClicked)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneClicked)];
        self.isModalController = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)onCancelClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onDoneClicked
{
    [[MemoItemStore sharedStore] createMemoItemInGroup:@"" withMemo:self.memoField.text andContentsOrNil:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
