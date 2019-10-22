//
//  Person.m
//  SetAndGetsForMask
//
//  Created by 卢育彪 on 2019/7/23.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import "Person.h"

//mask即掩码，表示二进制数（0b开头）
#define TallMask (1<<0)      //表示1左移0位：0b 0000 0001
#define RichMask (1<<1)      //表示1左移1位：0b 0000 0010
#define HandsomeMask (1<<2)  //表示1左移2位：0b 0000 0100

//拓展：10<<3即在10对应的二进制数后添加3个0

@interface Person()
{
    char _saveBox;
}

@end

@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        //用一个字节来存储三个变量：从最右往左依次为Tall、Rich、Handsome
        _saveBox = 0b00000101;
    }
    return self;
}

/*思路
 0000 0101（_saveBox）
|0000 0001（掩码）
 ---------
 0000 0001（赋值tall为1）
 
 0000 0101
&1111 1110（掩码取反）
 ---------
 0000 0100（赋值tall为0）
 
 1.如果赋的值为1，则按位或；
 2.如果赋的值为0，则掩码先取反，后按位与；
 */
- (void)setTall:(BOOL)tall
{
    if (tall) {
        _saveBox |= TallMask;
    } else {
        _saveBox &= ~TallMask;
    }
}

- (void)setRich:(BOOL)rich
{
    if (rich) {
        _saveBox |= RichMask;
    } else {
        _saveBox &= ~RichMask;
    }
}

- (void)setHandsome:(BOOL)handsome
{
    if (handsome) {
        _saveBox |= HandsomeMask;
    } else {
        _saveBox &= ~HandsomeMask;
    }
}

/*思路
 0000 0101
&0000 0001
 ---------
 0000 0001（取出tall值）
 
 1.按位与，用掩码取出_saveBox中特定位；
 2.结果>=1，取反为0，再取反为1；同理，为0则双取反后为0；
 */
- (BOOL)isTall
{
    return !!(_saveBox & TallMask);
}

- (BOOL)isRich
{
    return !!(_saveBox & RichMask);
}

- (BOOL)isHandsome
{
    return !!(_saveBox & HandsomeMask);
}

@end
