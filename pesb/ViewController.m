//
//  ViewController.m
//  pesb
//
//  Created by Harsh Shah on 1/1/18.
//  Copyright © 2018 Harsh Shah. All rights reserved.
//

#import "ViewController.h"
#import <Charts/Charts-Swift.h>

static NSString *kSimpleTableIdentifier = @"SimpleTableItem";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LineChartView *chartView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSimpleTableIdentifier];
    [self initializeChart];
}

#pragma mark Table view delegate methods
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSimpleTableIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}

- (void)initializeChart {
    LineChartView *chartView = self.chartView;
    chartView.rightAxis.enabled = NO;
    chartView.leftAxis.enabled = NO;
    chartView.xAxis.enabled = NO;
    chartView.legend.enabled = NO;
    chartView.userInteractionEnabled = NO;
    chartView.descriptionText = @"";
    
    NSMutableArray <ChartDataEntry*> *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        double val = arc4random_uniform(100) + 3;
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:val icon: [UIImage imageNamed:@"icon"]]];
    }
    
    LineChartDataSet *chartDataSet = nil;
    chartDataSet = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
    chartDataSet.drawCirclesEnabled = NO;
    chartDataSet.drawValuesEnabled = NO;
    
    NSMutableArray <LineChartDataSet *> *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:chartDataSet];
    
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    chartView.data = data;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
@end
