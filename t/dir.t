# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 4 };
use VCS;
use VCS::Dir;
ok(1); # If we made it this far, we're ok.

require "t/get_root.pl";
ok(1);
#########################
if (!$ENV{VSSROOT}) { $ENV{VSSROOT} = get_root() }
no_db() or my $dir = VCS::Dir->new('vcs://localhost/VCS::Vss/');
skip(no_db(), $dir);
no_db() or my @content = $dir->content();
skip(no_db(),@content); 
