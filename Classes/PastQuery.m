//
//  PastQuery.m
//  MyMail
//
//  Created by Liangjun Jiang on 1/18/09.
//  Copyright 2010 Google Inc.
//  
//

#import "PastQuery.h"
#import "ContactDBAccessor.h"
#import "DateUtil.h"

@implementation PastQuery

@synthesize datetime,text;


+(NSArray *)indices {
	// used for quickly displaying the past query list in the UI
	NSArray *timeIndex = @[@"datetime desc"];
	return @[timeIndex];
}

+(void)recordQuery:(NSString*)queryText withType:(int)searchType {
	// record a query for queryText - update the DB accordingly 

	sqlite3_stmt *insertStmt = nil;
	
	NSString *updateStmt = @"INSERT OR REPLACE INTO past_query(datetime, text, search_type) VALUES (?, ?, ?);";
	int dbrc = sqlite3_prepare_v2([[ContactDBAccessor sharedManager] database], [updateStmt UTF8String], -1, &insertStmt, nil);	
	if (dbrc != SQLITE_OK) 	{
		NSLog(@"Failed step in recordQuery with error %s", sqlite3_errmsg([[ContactDBAccessor sharedManager] database]));
		return;
	}

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSS"];
	
	NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];
	
	sqlite3_bind_text(insertStmt, 1, [formattedDateString UTF8String], -1, NULL);
	sqlite3_bind_text(insertStmt, 2, [queryText UTF8String], -1, NULL);
	sqlite3_bind_int(insertStmt, 3, searchType);

	if (sqlite3_step(insertStmt) != SQLITE_DONE) {
		NSLog(@"==========> Error inserting or updating PastQuery");
	}
	sqlite3_reset(insertStmt);
	

	if (insertStmt) {
		sqlite3_finalize(insertStmt);
		insertStmt = nil;
	}
	
	return;
}

+(void)clearAll {
	char* errorMsg;	
	int res = sqlite3_exec([[ContactDBAccessor sharedManager] database],[@"DELETE FROM past_query" UTF8String] , NULL, NULL, &errorMsg);
	if (res != SQLITE_OK) {
		NSString *errorMessage = [NSString stringWithFormat:@"Failed to create past_query table '%s'.", errorMsg];
		NSLog(@"errorMessage = '%@, original ERROR CODE = %i'",errorMessage,res);
	}
}

+(NSDictionary*)recentQueries {
	static sqlite3_stmt *stmt = nil;
	if(stmt == nil) {
		NSString *statement = @"SELECT datetime, text, search_type FROM past_query ORDER BY datetime DESC LIMIT 50;";
		int dbrc = sqlite3_prepare_v2([[ContactDBAccessor sharedManager] database], [statement UTF8String], -1, &stmt, nil);	
		if (dbrc != SQLITE_OK) {
			NSLog(@"Failed step in bindStmt with error %s", sqlite3_errmsg([[ContactDBAccessor sharedManager] database]));
			return @{};
		}
		
	}
	
	NSMutableArray* queries = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray* datetimes = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray* searchTypes = [NSMutableArray arrayWithCapacity:50]; 
	
	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init]; 
	[dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss.SSSS"];
	
	while((sqlite3_step (stmt)) == SQLITE_ROW) {
		
		NSDate *date = [NSDate date]; // default == now!
		const char * sqlVal = (const char *)sqlite3_column_text(stmt, 0);
		if(sqlVal != nil) {
			NSString *dateString = @(sqlVal);
			date = [dateFormatter dateFromString:dateString];
		}
		
		sqlVal = (const char *)sqlite3_column_text(stmt, 1);
		NSString* text = @(sqlVal);

		int searchType= sqlite3_column_int(stmt, 2);
		
		[datetimes addObject:date];
		[queries addObject:text];
		[searchTypes addObject:@(searchType)];
	}
	
	sqlite3_reset(stmt);
	stmt = nil;
	
	
	return @{@"datetimes": datetimes, @"queries": queries, @"searchTypes": searchTypes};
}


+(void)tableCheck {
	// create tables as appropriate
	char* errorMsg;	
	int res = sqlite3_exec([[ContactDBAccessor sharedManager] database],[@"CREATE TABLE IF NOT EXISTS past_query "
																			   "(pk INTEGER PRIMARY KEY, datetime REAL, text VARCHAR(50) UNIQUE, search_type INTEGER)" UTF8String] , NULL, NULL, &errorMsg);
	if (res != SQLITE_OK) {
		NSString *errorMessage = [NSString stringWithFormat:@"Failed to create past_query table '%s'.", errorMsg];
		NSLog(@"errorMessage = '%@, original ERROR CODE = %i'",errorMessage,res);
		return;
	}
}
@end

