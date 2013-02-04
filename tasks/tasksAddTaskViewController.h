//
//  tasksAddTaskViewController.h
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tasksItem;

@interface tasksAddTaskViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *taskTextInput;
@property tasksItem *taskToAdd;

@end
