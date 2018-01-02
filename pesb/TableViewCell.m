//
//  TableViewCell.m
//  pesb
//
//  Created by Harsh Shah on 1/1/18.
//  Copyright © 2018 Harsh Shah. All rights reserved.
//

#import "TableViewCell.h"
#import <Charts/Charts-Swift.h>
#import "PESBStock.h"

@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *stockName;
@property (weak, nonatomic) IBOutlet LineChartView *chart;
@property (weak, nonatomic) IBOutlet UILabel *stockData;
@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupChart];
}

- (void)setupChart {
    LineChartView *chartView = self.chart;
    chartView.rightAxis.enabled = NO;
    chartView.leftAxis.enabled = NO;
    chartView.xAxis.enabled = NO;
    chartView.legend.enabled = NO;
    chartView.userInteractionEnabled = NO;
    chartView.descriptionText = @"";
    chartView.backgroundColor = [UIColor clearColor];
}

- (void)setStock:(PESBStock *)stock {
    self.stockName.text = stock.symbol;
    self.stockData.text = [stock.lastPrice stringValue];
    [self setChartData:stock.dayData];
}

- (void)setChartData:(NSArray <NSNumber *> *)chartData {
    NSMutableArray <ChartDataEntry*> *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        [values addObject:[[ChartDataEntry alloc] initWithX:i y:[chartData[i] doubleValue]]];
    }
    
    LineChartDataSet *chartDataSet = nil;
    chartDataSet = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
    chartDataSet.drawCirclesEnabled = NO;
    chartDataSet.drawValuesEnabled = NO;
    chartDataSet.colors = @[[UIColor redColor]];
    
    NSMutableArray <LineChartDataSet *> *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:chartDataSet];
    
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    self.chart.data = data;
}

@end
