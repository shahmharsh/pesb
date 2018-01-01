//
//  ViewController.m
//  pesb
//
//  Created by Harsh Shah on 1/1/18.
//  Copyright © 2018 Harsh Shah. All rights reserved.
//

#import "ViewController.h"

static NSString *kSimpleTableIdentifier = @"SimpleTableItem";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSimpleTableIdentifier];
}

#pragma mark Table view delegate methods
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSimpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
@end
