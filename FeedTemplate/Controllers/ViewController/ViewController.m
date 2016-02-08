//
//  ViewController.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "ViewController.h"
#import "Accessor.h"
#import "FeedbackCell.h"
#import "PageControlCell.h"
#import "FullImageCell.h"
#import "Constant.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@property(nonatomic, weak)IBOutlet UITableView *feedTable;
@property(nonatomic, strong)NSArray *feedObjects;

@end


@implementation ViewController

#pragma mark - Application Life-Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _feedTable.backgroundColor = COLOR_TABLE_BG;
    _feedObjects = [[[Accessor sharedInstance] fileMgr] feedObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource/UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _feedObjects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [FeedbackCell cellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return HEIGHT_FEED_TABLE_SECTION_HEADER;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                  _feedTable.bounds.size.width,
                                                                  HEIGHT_FEED_TABLE_SECTION_HEADER)];
    headerView.backgroundColor = COLOR_TABLE_BG;
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *castCell = nil;
    FeedObject *object = [_feedObjects objectAtIndex:indexPath.section];
    
    switch (object.templateType) {
        case TEMPLATE_TYPE_1: {
            static NSString *temp1CellId = @"Template1CellId";
            FullImageCell *cell = [tableView dequeueReusableCellWithIdentifier:temp1CellId];
            if (cell == nil) {
                NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"FullImageCell" owner:self options:nil];
                cell = [cells firstObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            [cell.imgView setImageWithURL:[NSURL URLWithString:object.imgUrl] placeholderImage:nil];
            castCell = cell;
            break;
        }
            
        case TEMPLATE_TYPE_2: {
            static NSString *temp2CellId = @"Template2CellId";
            FeedbackCell *cell = [tableView dequeueReusableCellWithIdentifier:temp2CellId];
            cell.items = object.items;
            castCell = cell;
            break;
        }
            
        case TEMPLATE_TYPE_3: {
            static NSString *temp3CellId = @"Template3CellId";
            PageControlCell *cell = [tableView dequeueReusableCellWithIdentifier:temp3CellId];
            if (cell == nil) {
                NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"PageControlCell" owner:self options:nil];
                cell = [cells firstObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            [cell scrollViewSetupWithItems:object.items];
            castCell = cell;
            break;
        }
            
        default:
            break;
    }
    
    return castCell;
}

@end
