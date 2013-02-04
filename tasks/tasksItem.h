//
//  tasksItem.h
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tasksItem : NSObject

@property NSMutableAttributedString *task;

@property BOOL *completed;

-(id)initWithTask:(NSString *) myTask;

@end
