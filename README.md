# shell_mountebank

These are bash files for creating mountebank imposter with proxying, an intelligent mock for testing model DBS.

In order to use for the first time, start with running mb_start.sh, it will create a mountebank server with port 2525 on localhost.
Then run mb_add_imp.sh to add the imposter.
Run mb_save.sh if you want to save your imposter configuration till the next mountebank server usage.
mb_stop.sh makes mountebank finish its work.