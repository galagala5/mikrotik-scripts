:local filename"email_backup"; 

:log info "Genarating a backupfile $filename to send via email";
/system backup save name=email_backup

#email properties
:local id #[/system identity get name];
:local Time #[/system clock get time];
:local Date #[/system clock get date];

:local sendTo "your@mail.com";
:local Subject "Schedule Router Backup $id";
:local body "Find a backup file attached for router $id $timestamp";

# Main script code
:local SendEmail [:parse [/system script get SendEmailFunction source]];

$SendEmail SendTo=$SendTo Text=$body Subject=$Subject filename="$filename.backup"