//
//  ArticleRealm.m
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ArticleRealm.h"

@implementation ArticleRealm

- (id)initWithMantleModel:(ArticleModel *)articleModel {
    self = [super init];
    
    if (self) {
        self.leadParagraph = articleModel.leadParagraph;
        self.url = articleModel.url;
    }
    
    return self;
}

@end
