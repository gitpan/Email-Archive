use inc::Module::Install;

name 'Email-Archive';
all_from 'lib/Email/Archive.pm';

requires 'Moose';
requires 'Carp';
requires 'DBI';
requires 'File::ShareDir';
requires 'File::Slurp';
requires 'Email::Simple';
requires 'Email::Abstract';
requires 'SQL::Abstract';
requires 'autodie';

auto_install;

WriteAll;
