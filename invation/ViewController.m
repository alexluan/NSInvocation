//
//  ViewController.m
//  invation
//
//  Created by 栾有数 on 15/10/22.
//  Copyright © 2015年 栾有数. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    SEL myMethod = @selector(myLog);
//    //创建一个函数签名，这个签名可以是任意的,但需要注意，签名函数的参数数量要和调用的一致。
//    NSMethodSignature * sig  = [NSNumber instanceMethodSignatureForSelector:@selector(init)];//没有参数的时候
//    //通过签名初始化
//    NSInvocation * invocatin = [NSInvocation invocationWithMethodSignature:sig];
//    //设置target
//    [invocatin setTarget:self];
//    //设置selecteor
//    [invocatin setSelector:myMethod];
//    //消息调用
//    [invocatin invoke];
    
//    
//    SEL myMethod2 = @selector(myLog:parm:parm:);
//    NSMethodSignature * sig  = [[self class] instanceMethodSignatureForSelector:myMethod2];//有参数的时候
//    NSInvocation * invocatin = [NSInvocation invocationWithMethodSignature:sig];
//    [invocatin setTarget:self];
//    [invocatin setSelector:myMethod2];
//    int a=1;
//    int b=2;
//    int c=3;
//    [invocatin setArgument:&a atIndex:2];
//    [invocatin setArgument:&b atIndex:3];
//    [invocatin setArgument:&c atIndex:4];
//    [invocatin invoke];
    
    //返回值
    SEL myMethod2 = @selector(myLog:parm:parm:);
    NSMethodSignature * sig  = [[self class] instanceMethodSignatureForSelector:myMethod2];
    NSInvocation * invocatin = [NSInvocation invocationWithMethodSignature:sig];
    [invocatin setTarget:self];
    [invocatin setSelector:myMethod2];
    ViewController * view = self;
    int a=1;
    int b=2;
    int c=3;
    [invocatin setArgument:&view atIndex:0];//注意：1、这里设置参数的Index 需要从2开始，因为前两个被selector和target占用。下面这样写也没有任何问题：
    [invocatin setArgument:&myMethod2 atIndex:1];
    [invocatin setArgument:&a atIndex:2];
    [invocatin setArgument:&b atIndex:3];
    [invocatin setArgument:&c atIndex:4];
    [invocatin retainArguments];//- (void)retainArguments;这个方法，它会将传入的所有参数以及target都retain一遍。
    //我们将c的值设置为返回值
//    [invocatin setReturnValue:&c];//???这个是干嘛呢？？？
    [invocatin invoke];
    int d;
    //取这个返回值
    [invocatin getReturnValue:&d];
    NSLog(@"%d",d);
}
-(int)myLog:(int)a parm:(int)b parm:(int)c{
    NSLog(@"MyLog＊＊%d:%d:%d",a,b,c);
    return a+b+c;
}

//-(void)myLog:(int)a parm:(int)b parm:(int)c{
//    NSLog(@"MyLog＊＊：%d:%d:%d",a,b,c);
//}
//-(void)myLog{
//    NSLog(@"MyLog");
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
