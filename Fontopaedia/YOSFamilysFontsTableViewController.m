//
//  YOSFontTableViewController.m
//  Fontopaedia
//
//  Created by Yosnier on 07/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSFamilysFontsTableViewController.h"
#import "YOSFontViewController.h"

@interface YOSFamilysFontsTableViewController ()

@property (strong,nonatomic) NSArray *familyNames;

@end

@implementation YOSFamilysFontsTableViewController


-(id) initWithStyle:(UITableViewStyle)style {
    
    if (self = [super initWithStyle:style]) {
        
        self.familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        self.title = @"Fontopaedia";
        
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.familyNames count];
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.familyNames objectAtIndex:section];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[UIFont fontNamesForFamilyName:[self.familyNames objectAtIndex:section]] count];
}


-(NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    
    NSMutableArray *sectionedArray = [[NSMutableArray alloc] init] ;
    
    [sectionedArray autoContentAccessingProxy];
    
    for(char c ='A' ; c <= 'Z' ;  c++) {
        
        [sectionedArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    return sectionedArray;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
    }
    
    NSString *fontName = [[UIFont fontNamesForFamilyName:[self.familyNames objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName
                                          size:30.0];
    
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}


-(NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    NSInteger count = 0;
    
    for(NSString *character in self.familyNames) {
       
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}




#pragma mark - Table View delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *fontSelected = [[UIFont fontNamesForFamilyName:[self.familyNames objectAtIndex:indexPath.section]]
                              objectAtIndex:indexPath.row];
    
    UIFont *font =[UIFont fontWithName:fontSelected
                                  size:20.0];
    
    YOSFontViewController *fontVC = [[YOSFontViewController alloc]initWithFont:font];
    
    [self.navigationController pushViewController:fontVC
                                         animated:YES];
    
    
}






@end
