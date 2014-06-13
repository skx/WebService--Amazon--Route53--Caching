
use strict;

use ExtUtils::MakeMaker;

my %prereq_pm = ( 'WebService::Amazon::Route53'    => undef,
                  'JSON'                           => undef,
                );

WriteMakefile(
    NAME         => 'WebService::Amazon::Route53::Caching',
    VERSION_FROM => 'lib/WebService/Amazon/Route53/Caching.pm',
    PREREQ_PM    => \%prereq_pm,
    ABSTRACT     => 'Caching layer on top of WebService::Amazon::Route53.',
    AUTHOR       => 'Steve Kemp <steve@steve.org.uk>',


    META_MERGE => {
        resources => {
            license    => 'http://dev.perl.org/licenses/',
                     },
                  },
             );

