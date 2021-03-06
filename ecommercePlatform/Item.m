//
//  Item.m
//  ecommercePlatform
//
//  Created by Muhammad Suhail on 2017-03-06.
//  Copyright © 2017 Muhammad Suhail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "UIColor+OrShopColors.h"


@implementation Item

+(Item *) genericItem{
    Item *item =[[Item alloc] init];
    item.name=@"";
    item.amountNeeded=1;
    item.temperatureType=ItemTempAmbient;
    item.notes=@"";
    return item;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.amountNeeded = [[aDecoder decodeObjectForKey:@"amountNeeded"] integerValue];
        self.temperatureType = [[aDecoder decodeObjectForKey:@"temperatureType"] integerValue];
        self.notes = [aDecoder decodeObjectForKey:@"notes"];
        self.isChecked = [[aDecoder decodeObjectForKey:@"isChecked"] boolValue];
        self.checkedOrder = [[aDecoder decodeObjectForKey:@"checkedOrder"] integerValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:@(self.amountNeeded) forKey:@"amountNeeded"];
    [aCoder encodeObject:@(self.temperatureType) forKey:@"temperatureType"];
    [aCoder encodeObject:self.notes forKey:@"notes"];
    [aCoder encodeObject:@(self.isChecked) forKey:@"isChecked"];
    [aCoder encodeObject:@(self.checkedOrder) forKey:@"checkedOrder"];
}


+(NSArray *) arrayWithOrderedTemperatureTypes{
return @[
         @(ItemTempAmbient),
         @(ItemTempCold),
         @(ItemTempFrozen),
         @(ItemTempWarm),
         @(ItemTempHot)
         
         ];

}

- (UIColor *)colorFromTemp {
    switch (self.temperatureType) {
        case 0:     _colorFromTemp = [UIColor frozenColor];     break;
        case 1:     _colorFromTemp = [UIColor coldColor];       break;
        case 2:     _colorFromTemp = [UIColor ambientColor];    break;
        case 3:     _colorFromTemp = [UIColor warmColor];       break;
        case 4:     _colorFromTemp = [UIColor hotColor];        break;
        default:    _colorFromTemp = [UIColor whiteColor];
    }
    
    return _colorFromTemp;
}


-(NSString *) description {
    return (self.name) ? self.name : @"no item name";
}

@end

