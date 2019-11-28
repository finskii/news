//
//  DBService.m
//  news
//
//  Created by Vasilii Dmitriev on 25.11.2019.
//  Copyright © 2019 Vasilii Dmitriev. All rights reserved.
//

#import "DBService.h"
#import "AppDelegate.h"
@import CoreData;
#import "NewsItem+CoreDataProperties.h"


@implementation DBService

- (void) save:(NSString*)name {
    AppDelegate* _appDelegate = UIApplication.sharedApplication.delegate;
    NSManagedObjectContext* _managedContext = _appDelegate.persistentContainer.viewContext;
    NSEntityDescription* _entity = [NSEntityDescription entityForName:@"NewsItem" inManagedObjectContext:_managedContext];
    NSManagedObject* _newsItem = [[NSManagedObject alloc] initWithEntity:_entity insertIntoManagedObjectContext:_managedContext];
    _newsItem
    
}

//                               in: managedContext)!
//  let person = NSManagedObject(entity: entity,
//                               insertInto: managedContext)
//
//  // 3
//  person.setValue(name, forKeyPath: "name")
//
//  // 4
//  do {
//    try managedContext.save()
//    people.append(person)
//  } catch let error as NSError {
//    print("Could not save. \(error), \(error.userInfo)")
//  }
//}

@end
