//
//  DetailViewController.h
//  MondayWork
//
//  Created by azu on 2013/09/06.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end