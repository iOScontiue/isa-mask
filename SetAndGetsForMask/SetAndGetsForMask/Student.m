//
//  Student.m
//  SetAndGetsForMask
//
//  Created by 卢育彪 on 2019/7/30.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import "Student.h"

@interface Student()
{
    /*思路
     1.用一个结构体来存放变量；
     2.结构体支持位域：按先后顺序，一个char字符一个字节（0b0000 0000），从最右至左依次为tall、rich、handsome；
     */
    struct {
        char tall : 1;//用一位来存储
        char rich : 1;
        char handsome : 1;
    }_tallRichHandsome;
}

@end

@implementation Student

- (void)setTall:(BOOL)tall
{
    _tallRichHandsome.tall = tall;
}

- (void)setRich:(BOOL)rich
{
    _tallRichHandsome.rich = rich;
}

- (void)setHandsome:(BOOL)handsome
{
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isTall
{
    return !!_tallRichHandsome.tall;//非0（包括负数）取反为0
}

- (BOOL)isRich
{
    return !!_tallRichHandsome.rich;
}

- (BOOL)isHandsome
{
    return !!_tallRichHandsome.handsome;
}

@end
