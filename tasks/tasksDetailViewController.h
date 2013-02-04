//
//  tasksDetailViewController.h
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tasksDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
