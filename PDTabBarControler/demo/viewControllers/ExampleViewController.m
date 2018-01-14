//
//  ExampleViewController1.m
//  PDTabBarControler
//
//  Created by pird on 2018/1/14.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "ExampleViewController.h"
#import "PDTabBarController.h"

@interface ExampleViewController ()

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"change images",
                @"change font",
                @"offset",
                @"translucent",
                @"white background",
                @"back"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"AAAA"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AAAA" forIndexPath:indexPath];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AAAA"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
            [self changeImage];
            break;
        case 1:
            [self changeFont];
            break;
        case 2:
            [self changeOffset];
            break;
        case 3:
            [self setTranslucent];
            break;
        case 4:
            [self setWhiteBackground];
            break;
        case 5:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - action

- (void)changeImage {
    NSArray *items = self.pd_tabBarController.tabBar.items;
    for(PDTabBarItem *item in items) {
        NSUInteger flag = arc4random_uniform(3)+1;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%lu.png",flag]];
        [item setImage:image];
    }
}

- (void)changeFont {
    NSArray *items = self.pd_tabBarController.tabBar.items;
    for(PDTabBarItem *item in items) {
        NSUInteger random = arc4random_uniform(8) + 10 ;
        [item setFont:[UIFont systemFontOfSize:random*1.0]];
    }
}

- (void)changeOffset {
    
    NSArray *items = self.pd_tabBarController.tabBar.items;
    for(PDTabBarItem *item in items) {
        NSInteger random = arc4random_uniform(4);
        NSInteger random2 = arc4random_uniform(4);
        NSInteger random3 = arc4random_uniform(100);
        if(random3 % 2 == 0){
            random *= -1;
        }
        random3 = arc4random_uniform(100);
        if(random3 % 2 == 0){
            random2 *= -1;
        }
        [item setTitlePositionAdjustment:UIOffsetMake(random, random2)];
    }
}

- (void)setTranslucent {
    [self.pd_tabBarController.tabBar setStyle:PDTabBarStyleTranslucent];
}

- (void)setWhiteBackground {
    [self.pd_tabBarController.tabBar setStyle:PDTabBarStyleWhiteBackground];
}


@end
