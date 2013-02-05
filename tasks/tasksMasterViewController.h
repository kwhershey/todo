//
//  tasksMasterViewController.h
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tasksDataController;

@interface tasksMasterViewController : UITableViewController

@property tasksDataController *dataController;

-(IBAction)Done:(UIStoryboardSegue *)segue;
-(IBAction)Cancel:(UIStoryboardSegue *)segue;
-(IBAction)ReturnDone:(UIStoryboardSegue *)segue;

@end
