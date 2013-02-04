//
//  tasksDetailViewController.m
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import "tasksDetailViewController.h"

@interface tasksDetailViewController ()
- (void)configureView;
@end

@implementation tasksDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
