//
//  main.m
//  SetAndGetsForMask
//
//  Created by 卢育彪 on 2019/7/23.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"
#import "Student.h"
#import "Worker.h"
#import "Engineer.h"

typedef enum{
    YBOptionTypeNone = 0,   //0b0000
    YBOptionTypeOne = 1<<0, //0b0001
    YBOptionTypeTwo = 1<<1, //0b0010
    YBOptionTypeThree = 1<<2, //0b0100
    YBOptionTypeFour = 1<<3  //0b1000
}YBOptionType;

struct bs {
    unsigned a : 9;//如果超过位域范围(511)，则只取范围内的值，其他位（高位）丢弃
    unsigned b : 4;
    unsigned c : 3;
}bit, *pbit;

void test1()
{
    bit.a = 512;//超过位域范围报警告
    bit.b = 10;
    bit.c = 7;
    NSLog(@"%d,%d,%d\n", bit.a, bit.b, bit.c);
    
    pbit=&bit;
    pbit-> a=0;
    pbit-> b&=3;
    pbit-> c|=1;
    printf("%d,%d,%d\n ",pbit-> a,pbit-> b,pbit-> c);
}

void test2()
{
    Person *per = [[Person alloc] init];
    per.tall = NO;
    per.rich = NO;
    per.handsome = YES;
    NSLog(@"%d %d %d", per.isTall, per.isRich, per.isHandsome);
}

void test3()
{
    Student *stu = [[Student alloc] init];
    stu.tall = YES;
    stu.rich = NO;
    stu.handsome = YES;
    NSLog(@"%d %d %d", stu.isTall, stu.isRich, stu.isHandsome);
}

void test4()
{
    Worker *worker = [[Worker alloc] init];
//    worker.tall = YES;
    worker.rich = NO;
    worker.handsome = NO;
    worker.thin = YES;
    NSLog(@"%d %d %d", worker.isThin, worker.isRich, worker.isHandsome);
}

void test5()
{
    Engineer *engineer = [[Engineer alloc] init];
//    engineer.age = 12;
//    engineer.level = 6;
//    engineer.workers = 5;
    
    //0b 1111 1111 1111 1111（十进制：65535）
    //0b 0010 1100 1110 1101（十进制：11501）
    engineer->_personalInfo.bits =11501;
    NSLog(@"%d %d %d", engineer.getAge, engineer.getLevel, engineer.getWorkers);
    //2019-10-08 16:42:09.612140+0800 SetAndGetsForMask[1488:127227] 7 16 8160
    //
}

void test6(YBOptionType option)
{
    /*按位或叠加（包含多种情况），按位与取出（获得特定情况）
     0b0001
     0b0100
   | 0b1000
  ----------
     0b1101
   & 0b0100
  ----------
     0b0100
     */
    if (option & YBOptionTypeOne) {
        NSLog(@"contain YBOptionTypeOne");
    }
    
    if (option & YBOptionTypeTwo) {
        NSLog(@"contain YBOptionTypeTwo");
    }
    
    if (option & YBOptionTypeThree) {
        NSLog(@"contain YBOptionTypeThree");
    }
    
    if (option & YBOptionTypeFour) {
        NSLog(@"contain YBOptionTypeFour");
    }
}

void test7()
{
    Person *per = [[Person alloc] init];
    
    __weak Person *perWeak = per;
    perWeak = nil;
    
    objc_setAssociatedObject(per, @"name", @"jack", OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(per, @"name", nil, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    int i = 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        test1();
//        test2();
//        test3();
//        test4();
//        test5();
//        test6(YBOptionTypeOne | YBOptionTypeThree | YBOptionTypeFour);
        test7();
    }
    return 0;
}
