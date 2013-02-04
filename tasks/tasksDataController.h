//
//  tasksDataController.h
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import <Foundation/Foundation.h>
@class tasksItem;

@interface tasksDataController : NSObject

@property (copy,nonatomic)NSMutableArray *taskList;

-(void)initializeDefaultDataList;

-(NSInteger)countOfTaskList;

-(tasksItem *)itemAtIndex:(NSUInteger)index;

-(void)removeItemAtIndex:(NSUInteger)index;

-(void)addTasksItem:(tasksItem *)newItem;



@end
