//
//  CBNodeTestViewController.m
//  CB_Test_01
//
//  Created by Elaine on 16--26.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "CBNodeTestViewController.h"

struct CNode{
    NSInteger num;
    struct CNode *next;
};
typedef struct CNode CBNode;

@interface CBNodeTestViewController ()

@end

@implementation CBNodeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test
{
    NSArray *array = @[@"12-11", @"12-11", @"12-11", @"12-12", @"12-13", @"12-14"];
    NSSet *mySet = [NSSet setWithArray:array];
    
    NSLog(@"%@", mySet);
}

- (void)testNode
{
    //  创建链表
    CBNode *head = malloc(sizeof(CBNode));
    head->num = 0;
    head->next = NULL;
    
    CBNode *tempHead = head;
    
    for (int i = 1; i < 10; i++) {
        CBNode *myNode = malloc(sizeof(CBNode));
        myNode->num = i;
        myNode->next = NULL;
        head->next = myNode;
        head = myNode;
    }
    
    // 输出链表
    while (tempHead) {
        printf("---%ld \n", tempHead->num);
        tempHead = tempHead->next;
    }
    
    //  链表删除 (比如删除2) <尚需修改>
    //    while (tempHead) {
    //        if (tempHead->num == 2) {
    //            CBNode *nextNode = tempHead->next;
    //            free(tempHead);
    //            tempHead = nextNode;
    //            break;
    //        }
    //    }
    
    //  链表逆序输出
    //    CBNode *myHeadNode = tempHead;
    CBNode *lastNode = NULL;
    while (tempHead) {
        CBNode *nextNode = tempHead->next;
        tempHead->next = lastNode;
        lastNode = tempHead;
        tempHead = nextNode;
    }
    
    
    // 输出链表
    while (lastNode) {
        printf("****%ld \n", lastNode->num);
        lastNode = lastNode->next;
    }
    
}

@end
