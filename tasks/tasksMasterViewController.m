//
//  tasksMasterViewController.m
//  tasks
//
//  Created by Mary Beth McWhinney on 2/3/13.
//  Copyright (c) 2013 Mary Beth McWhinney. All rights reserved.
//

#import "tasksMasterViewController.h"
#import "tasksDetailViewController.h"
#import "tasksDataController.h"
#import "tasksItem.h"
#import "tasksAddTaskViewController.h"

/*
@interface tasksMasterViewController () {
    NSMutableArray *_objects;
}
@end
*/
 
@implementation tasksMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[tasksDataController alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.dataController =[[tasksDataController alloc]init];
    

    UIApplication *myApp = [UIApplication sharedApplication];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:myApp];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    if ([fileManager fileExistsAtPath:filePath] == YES)
    {
         self.dataController.taskList = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:filePath]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
 */

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfTaskList];
    //return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    tasksItem *newItem = [self.dataController itemAtIndex:indexPath.row];
    NSMutableAttributedString *cellString =[[NSMutableAttributedString alloc]initWithString:newItem.task];
    if(newItem.completed)
    {
        [cellString addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, [cellString length])];
        [cellString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, [cellString length])];
    }
    else
    {
        [cellString addAttribute:NSStrikethroughStyleAttributeName value:@0 range:NSMakeRange(0, [cellString length])];
        [cellString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, [cellString length])];
    }
    cell.textLabel.attributedText = cellString;
    if(newItem.completed)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    return cell;
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


-(IBAction)Done:(UIStoryboardSegue *)segue
{
    if([[segue identifier] isEqualToString:@"ReturnInput"] || [[segue identifier] isEqualToString:@"ReturnReturnInput"])
    {
        tasksAddTaskViewController *addController = [segue sourceViewController];
        //if(addController.taskToAdd)
        if(! [addController.taskTextInput.text isEqualToString:@""])
        {
            tasksItem *newItem;
            newItem = [[tasksItem alloc] initWithTask:addController.taskTextInput.text];
            [self.dataController addTasksItem:newItem];
            addController.taskTextInput.text = @"";
            [[self tableView] reloadData];
            
            [self dismissViewControllerAnimated: YES completion:NULL];
        }
        
        
    }
    
}
 
/*
-(IBAction)ReturnDone:(UIStoryboardSegue *)segue
{
    if([[segue identifier] isEqualToString:@"ReturnReturnInput"])
     {
    tasksAddTaskViewController *addController = [segue sourceViewController];
    if(addController.taskToAdd)
    {
        [self.dataController addTasksItem:addController.taskToAdd];
        [[self tableView] reloadData];
    }
    
    [self dismissViewControllerAnimated: YES completion:NULL];
    }
    
}
 */

-(IBAction)Cancel:(UIStoryboardSegue *)segue
{
    if([[segue identifier] isEqualToString:@"CancelInput"])
    {
        [self dismissViewControllerAnimated: YES completion:NULL];
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController removeItemAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } //else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //}
}
 

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataController changeStateAtIndex:indexPath.row];
    [[self tableView] reloadData];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"Entering Background");

    NSArray *data = [[NSArray alloc] initWithArray:self.dataController.taskList];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *fullFileName = [NSString stringWithFormat:@"%@/data.plist", docDir];
    [NSKeyedArchiver archiveRootObject:data toFile:fullFileName];
    
}

 



@end
