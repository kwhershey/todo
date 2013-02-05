//
//  tasksDataController.m
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import "tasksDataController.h"
#import "tasksItem.h"

@implementation tasksDataController

//custom initializer.  need to initialize the list
-(id)init
{
    self = [super init];
    [self initializeDefaultDataList];
    
    return self;
}

//initializes the mutable array
-(void)initializeDefaultDataList
{
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    self.taskList = newArray;
    

    
}

//allows us to set the task list.  Will be useful when loading stored list.
-(void)setTaskList:(NSMutableArray *)newList
{
    if(_taskList !=newList)
    { 
        _taskList = [newList mutableCopy];
    }
}

-(NSInteger)countOfTaskList
{
    return [self.taskList count];
}

-(tasksItem *)itemAtIndex:(NSUInteger)index
{
    return [self.taskList objectAtIndex:index];
}

-(void)removeItemAtIndex:(NSUInteger)index
{
    [self.taskList removeObjectAtIndex:index];
}

-(void)addTasksItem:(tasksItem *)newItem
{
    [self.taskList addObject:newItem];
}

-(void)changeStateAtIndex:(NSUInteger)index
{
    tasksItem *taskToChange = [self itemAtIndex:index];
    [taskToChange switchState];
    [self.taskList replaceObjectAtIndex:index withObject:taskToChange];
    
}

@end
