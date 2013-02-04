//
//  tasksItem.m
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import "tasksItem.h"

@implementation tasksItem

-(id)initWithTask:(NSString *)myTask
{
    self = [super init];
    self.task = myTask;
    return self;
}


@end
