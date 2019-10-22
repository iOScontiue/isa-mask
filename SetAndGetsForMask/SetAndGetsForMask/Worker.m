//
//  Worker.m
//  SetAndGetsForMask
//
//  Created by 卢育彪 on 2019/9/10.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import "Worker.h"

#define TallMask (1<<0)//也可以左移6位，剩余位没用到
#define RichMask (1<<1)
#define HandsomeMask (1<<2)
#define ThinMask (1<<3)

@interface  Worker()
{
    //苹果系统设计思路
    union {
        char bits;//一个字节存储结构体中的所有成员变量
        struct {//摆设用：位域，增加可读性
            char tall : 1;//占一位
            char rich : 1;
            char handsome : 1;
            char thin : 1;
        };
    }_tallRichHandsome;
}

@end

@implementation Worker

- (void)setTall:(BOOL)tall
{
    if (tall) {
        _tallRichHandsome.bits |= TallMask;
    } else {
        _tallRichHandsome.bits &= ~TallMask;
    }
}

- (void)setRich:(BOOL)rich
{
    if (rich) {
        _tallRichHandsome.bits |= RichMask;
    } else {
        _tallRichHandsome.bits &= ~RichMask;
    }
}

- (void)setHandsome:(BOOL)handsome
{
    if (handsome) {
        _tallRichHandsome.bits |= HandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~HandsomeMask;
    }
}

- (void)setThin:(BOOL)thin
{
    if (thin) {
        _tallRichHandsome.bits |= ThinMask;
    } else {
        _tallRichHandsome.bits &= ~ThinMask;
    }
}

- (BOOL)isTall
{
    return !!(_tallRichHandsome.bits & TallMask);
}

- (BOOL)isRich
{
    return !!(_tallRichHandsome.bits & RichMask);
}

- (BOOL)isHandsome
{
    return !!(_tallRichHandsome.bits & HandsomeMask);
}

- (BOOL)isThin
{
    return !!(_tallRichHandsome.bits & ThinMask);
}

@end
