//
//  DetailViewController.h
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

