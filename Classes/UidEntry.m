//
//  UidEntry.m
//  MyMail
//
//

#import "UidEntry.h"
#import "UidDBAccessor.h"

@implementation UidEntry
+(void)tableCheck {
	// create tables as appropriate
	char* errorMsg;	 
	// note that the table is called uid_entry, not "uid" as in earlier versions that weren't actually adding to this table
	int res = sqlite3_exec([[UidDBAccessor sharedManager] database],[@"CREATE TABLE IF NOT EXISTS uid_entry "
																		  "(pk INTEGER PRIMARY KEY, uid VARCHAR(50), folder_num INTEGER, md5 VARCHAR(32))" UTF8String] , NULL, NULL, &errorMsg);
	if (res != SQLITE_OK) {
		NSString *errorMessage = [NSString stringWithFormat:@"Failed to create uid_entry store '%s'.", errorMsg];
		NSLog(@"errorMessage = '%@, original ERROR CODE = %i'",errorMessage,res);
	}
	
	res = sqlite3_exec([[UidDBAccessor sharedManager] database],[@"CREATE INDEX IF NOT EXISTS uid_entry_md5 on uid_entry(md5);" UTF8String] , NULL, NULL, &errorMsg);
	if (res != SQLITE_OK) {
		NSString *errorMessage = [NSString stringWithFormat:@"Failed to create uid_entry_md5 index '%s'.", errorMsg];
		NSLog(@"errorMessage = '%@, original ERROR CODE = %i'",errorMessage,res);
	}
}
@end
