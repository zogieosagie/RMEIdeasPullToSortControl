//
//  RMEViewController.m
//  RMEIdeasPullToSortExample
//
//  Created by Osagie Zogie-Odigie on 20/07/2013.
//  The MIT License (MIT)
//
//  Copyright (c) 2013 RME-IDEAS Limited
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  If you use this software in a product, an acknowledgment in the product
//  documentation would be appreciated but is not required.
//

#import "RMEViewController.h"
#import "RMECustomCell.h"
#import "RMEIdeasPullDownControl.h"

#define kLastSelected @"kLastSelected"

typedef enum
{
    AtoZ = 0,
    ZtoA,
    HighestToLowest,
    LowestToHighest,
    OldestToNewest,
    NewestToOldest
}
TableSortSortCriteria;

@interface RMEViewController ()<RMEIdeasPullDownControlDataSource, RMEIdeasPullDownControlProtocol>
@property (weak, nonatomic) IBOutlet UITableView *exampleTableView;
@property (strong, nonatomic) RMEIdeasPullDownControl *rmeideasPullDownControl;
@property (strong, nonatomic) NSArray *sortTitlesArray;

@end

@implementation RMEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.sortTitlesArray = @[@"Listed from A - Z", @"Listed from Z - A", @"Listed from HIGH - LOW", @"Listed from LOW - HIGH", @"Listed from LOW - HIGH", @"Listed from LOW - HIGH"];
    
    self.rmeideasPullDownControl = [[RMEIdeasPullDownControl alloc] initWithDataSource:self
                                                                              delegate:self
                                                                      clientScrollView:self.exampleTableView];
    CGRect originalFrame = self.rmeideasPullDownControl.frame;
    self.rmeideasPullDownControl.frame = CGRectMake(0.0, 0.0, originalFrame.size.width, originalFrame.size.height);
    [self.view addSubview:self.rmeideasPullDownControl];
    // [self.view insertSubview:self.rmeideasPullDownControl belowSubview:self.exampleTableView];
    
    [self.exampleTableView registerNib:[UINib nibWithNibName:@"RMECustomCell" bundle:nil]
                forCellReuseIdentifier:@"RMECustomCell"];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.rmeideasPullDownControl selectControlAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:kLastSelected]];//Retrieve last selection
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview datasource and delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RMECustomCell *cell = [self.exampleTableView dequeueReusableCellWithIdentifier:@"RMECustomCell"];
    cell.mainTitleLabel.text = @"RME-IDEAS Limited";
    cell.subTitleOneLabel.text = @"Founded:2010";
    cell.subTitleTwoLabel.text = @"Worth: $100, 000, 000";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - RMEIdeasePullDownControl DataSource and Delegate methods
- (void) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
          selectedControlAtIndex:(NSUInteger)controlIndex
{
    switch (controlIndex)
    {
        case AtoZ:
//            self.sortedPages = [[DataManager sharedInstance] contactsIDSortedBy:AtoZ];
//            [[NSUserDefaults standardUserDefaults] setInteger:AtoZ forKey:kReachoutBookSortValueKey];
            break;
            
        case ZtoA:
//            self.sortedPages = [[DataManager sharedInstance] contactsIDSortedBy:ZtoA];
//            [[NSUserDefaults standardUserDefaults] setInteger:ZtoA forKey:kReachoutBookSortValueKey];
            break;
            
        case HighestToLowest:
//            self.sortedPages = [[DataManager sharedInstance] contactsIDSortedBy:MostToLeast];
//            [[NSUserDefaults standardUserDefaults] setInteger:MostToLeast forKey:kReachoutBookSortValueKey];
            break;
            
        case LowestToHighest:
//            self.sortedPages = [[DataManager sharedInstance] contactsIDSortedBy:LeastToMost];
//            [[NSUserDefaults standardUserDefaults] setInteger:LeastToMost forKey:kReachoutBookSortValueKey];
            break;
            
        case OldestToNewest:
//            self.sortedPages = [[DataManager sharedInstance] contactsIDSortedBy:Random];
//            [[NSUserDefaults standardUserDefaults] setInteger:Random forKey:kReachoutBookSortValueKey];
            break;
            
        case NewestToOldest:
        {
//            InfoScreenViewController *infoScreen = [[InfoScreenViewController alloc] initWithNibName:@"InfoScreenViewController" bundle:nil startPage:ReachoutBookStartPage owner:self];
//            [self presentViewController:infoScreen animated:YES completion:^{
//                [self.rmeideasPullDownControl selectControlAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:kReachoutBookSortValueKey]];
//                
//            }];
        }
            
            break;
            
        default:
            break;
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //NSLog(@"Sorted Okoko %@", self.sortedPages);
    //[self reloadPageViewController];
    
}

- (NSUInteger) numberOfButtonsRequired:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
{
    return 6;
}

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl imageForControlAtIndex:(NSUInteger)controlIndex
{
    UIImage *image0 = [UIImage imageNamed:@"SortAZ.png"];
    UIImage *image1 = [UIImage imageNamed:@"SortZA.png"];
    UIImage *image2 = [UIImage imageNamed:@"HighLow.png"];
    UIImage *image3 = [UIImage imageNamed:@"LowHigh.png"];
    UIImage *image4 = [UIImage imageNamed:@"OldNew.png"];
    UIImage *image5 = [UIImage imageNamed:@"NewOld.png"];
    
    NSArray *imagesArray = @[image0, image1, image2, image3, image4, image5];
    return imagesArray[controlIndex];
}

- (UIImage*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
      selectedImageForControlAtIndex:(NSUInteger)controlIndex
{
    UIImage *image0 = [UIImage imageNamed:@"SortAZSelected.png"];
    UIImage *image1 = [UIImage imageNamed:@"SortZASelected.png"];
    UIImage *image2 = [UIImage imageNamed:@"HighLowSelected.png"];
    UIImage *image3 = [UIImage imageNamed:@"LowHighSelected.png"];
    UIImage *image4 = [UIImage imageNamed:@"OldNewSelected.png"];
    UIImage *image5 = [UIImage imageNamed:@"NewOldSelected.png"];
    
    NSArray *imagesArray = @[image0, image1, image2, image3, image4, image5];
    return imagesArray[controlIndex];
}

- (NSString*) rmeIdeasPullDownControl:(RMEIdeasPullDownControl*)rmeIdeasPullDownControl
               titleForControlAtIndex:(NSUInteger)controlIndex
{
    return self.sortTitlesArray[controlIndex];
}

@end
