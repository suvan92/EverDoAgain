//
//  NewToDoViewController.h
//  EveryDoAgain
//
//  Created by Suvan Ramani on 2016-11-23.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EveryDoAgain+CoreDataModel.h"

@interface NewToDoViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *context;

@end
