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
    self.completed = FALSE;
    //self.task = [[NSMutableAttributedString alloc] initWithString:myTask];


    
    return self;
}

/*
-(void)strikeThrough
{
    [self.task addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, [self.task length])];
    [self.task addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, [self.task length])];
    self.completed = YES;
}

-(void)unstrikeThrough
{
    [self.task addAttribute:NSStrikethroughStyleAttributeName value:@0 range:NSMakeRange(0, [self.task length])];
    [self.task addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, [self.task length])];
    self.completed = FALSE;
}
*/

-(void)switchState
{
    if(self.completed)
    {
        self.completed = FALSE;
    }
    else
    {
        self.completed = TRUE;
    }
}


static NSString *const ktask = @"task";
static NSString *const kcompleted = @"completed";

-(id)initWithCoder:(NSCoder *)decoder {
       if ((self=[super init])) {
        self.task = [decoder decodeObjectForKey:ktask];
        self.completed = [decoder decodeIntegerForKey:kcompleted];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.task forKey:ktask];
    [encoder encodeInt:self.completed forKey:kcompleted];
}



@end
