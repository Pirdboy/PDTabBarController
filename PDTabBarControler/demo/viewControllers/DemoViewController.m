//
//  DemoViewController.m
//  PDTabBarControler
//
//  Created by pird on 2018/1/14.
//  Copyright © 2018年 pird. All rights reserved.
//

#import "DemoViewController.h"
#import "PDTabBarController.h"

float r(){
    uint32_t a = arc4random_uniform(10000)%255;
    return a*1.0/255.0;
}

@interface DemoViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Root";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BBBB"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBBB" forIndexPath:indexPath];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BBBB"];
    }
    cell.textLabel.text = @"Test TabBarController";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        [self pushToTabBarController];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (void)pushToTabBarController {
    UIViewController *vc1 = [[NSClassFromString(@"ExampleViewController") alloc] init];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor colorWithRed:r() green:r() blue:r() alpha:1.0];
    NSArray *array = @[vc1, vc2, vc3, vc4, vc5];
    
    PDTabBarItem *item1 = [[PDTabBarItem alloc] initWithTitle:@"Item1" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home_selected"]];
    PDTabBarItem *item2 = [[PDTabBarItem alloc] initWithTitle:@"Item2" image:[UIImage imageNamed:@"reference"] selectedImage:[UIImage imageNamed:@"reference_selected"]];
    PDTabBarItem *item3 = [[PDTabBarItem alloc] initWithTitle:@"Item3" image:[UIImage imageNamed:@"fortune"] selectedImage:[UIImage imageNamed:@"fortune_selected"]];
    PDTabBarItem *item4 = [[PDTabBarItem alloc] initWithTitle:@"Item4" image:[UIImage imageNamed:@"life"] selectedImage:[UIImage imageNamed:@"life_selected"]];
    PDTabBarItem *item5 = [[PDTabBarItem alloc] initWithTitle:@"Item5" image:[UIImage imageNamed:@"mine"] selectedImage:[UIImage imageNamed:@"mine_selected"]];
    NSArray *array2 = @[item1, item2, item3, item4, item5];
    
    PDTabBarController *tabBarController = [[PDTabBarController alloc] initWithViewControllers:array tabBarItems:array2];
    
    [self.navigationController pushViewController:tabBarController animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
