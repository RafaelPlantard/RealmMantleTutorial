//
//  ArticleModel.m
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"leadParagraph": @"lead_paragraph",
             @"url": @"web_url"
             };
}

@end
