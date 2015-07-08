//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Scott on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RARecipe.h"

@interface RecipeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *recipeTable;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

   
    // Do any additional setup after loading the view.
    
    self.recipeTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

//    [self.recipeTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.recipeTable];
    self.recipeTable.dataSource = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [RARecipes count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
       
    
    if (!cell) {
    
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];

    }
    
    
    NSString *title =[RARecipes titleAtIndex:indexPath.row];
    cell.textLabel.text = title;

    
    NSString *descripcion =[RARecipes descriptionAtIndex:indexPath.row];
    cell.detailTextLabel.text = descripcion;

               
    return cell;
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
