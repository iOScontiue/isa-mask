//
//  Engineer.m
//  SetAndGetsForMask
//
//  Created by 卢育彪 on 2019/9/30.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import "Engineer.h"

@implementation Engineer

//- (void)setAge:(int)age
//{
//    self->_personalInfo.bits |= AgeMask;
//}
//
//- (void)setLevel:(int)level
//{
//    self->_personalInfo.bits |= LevelMask;
//}
//
//- (void)setWorkers:(int)workers
//{
//    self->_personalInfo.bits |= WorkersMask;
//}

- (int)getAge
{
    return self->_personalInfo.bits & AgeMask;
}

- (int)getLevel
{
     return self->_personalInfo.bits & LevelMask;
}

- (int)getWorkers
{
     return self->_personalInfo.bits & WorkersMask;
}

@end
