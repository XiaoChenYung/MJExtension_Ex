//
//  ViewController.m
//  MJExtensionExample
//
//  Created by MJ Lee on 15/11/8.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface Person : NSObject
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray *friends;
@property (assign, nonatomic) NSInteger age;
@property (copy, nonatomic) NSString *name;
@end

@implementation Person

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    // 注意释放内存！
    free(ivars);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
