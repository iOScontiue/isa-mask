//
//  Engineer.h
//  SetAndGetsForMask
//
//  Created by 卢育彪 on 2019/9/30.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//位域位置（变量值存储位置）
#define AgeMask 0b00000111//最低三位存储
#define LevelMask (1<<4)//低位往高位数，第5位存储
#define WorkersMask 0b0001111111100000

@interface Engineer : NSObject
{
    @public
    union {
        int bits;
        struct {//位域范围（变量值范围）
            int age : 3;
            int level : 1;
            int workers : 8;
        };
    }_personalInfo;
}

//- (void)setAge:(int)age;
//- (void)setLevel:(int)level;
//- (void)setWorkers:(int)workers;

- (int)getAge;
- (int)getLevel;
- (int)getWorkers;

@end

NS_ASSUME_NONNULL_END
