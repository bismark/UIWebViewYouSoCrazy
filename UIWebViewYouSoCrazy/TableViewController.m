//
//  UIWVYSCTableViewController.m
//  UIWebViewYouSoCrazy
//
//  Created by Ryan Johnson on 13/10/25.
//  Copyright (c) 2013 Ryan Johnson. All rights reserved.
//

#import "TableViewController.h"
#import "WebViewControllerType0.h"
#import "WebViewControllerType1.h"
#import "WebViewControllerType2.h"
#import "WebViewControllerType3.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"scalesPageToFit == NO";
            break;
        case 1:
            cell.textLabel.text = @"scalesPageToFit == YES";
            break;
        case 2:
            cell.textLabel.text = @"multipleRenders hack";
            break;
        case 3:
            cell.textLabel.text = @"injecting meta viewport";
            break;

        default:
            break;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   switch (indexPath.row) {
    case 0:
           [self.navigationController pushViewController:[[WebViewControllerType0 alloc] init] animated:YES];
        break;
    case 1:
           [self.navigationController pushViewController:[[WebViewControllerType1 alloc] init] animated:YES];
        break;
    case 2:
           [self.navigationController pushViewController:[[WebViewControllerType2 alloc] init] animated:YES];
        break;
    case 3:
           [self.navigationController pushViewController:[[WebViewControllerType3 alloc] init] animated:YES];
           break;

    default:
        break;
    }

}

@end
