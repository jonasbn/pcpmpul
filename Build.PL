# Build.PL for Perl::Critic::JONASBN

# $Id$

use strict;
use Module::Build;

my $build = Module::Build->new(
    dist_author          => 'Jonas B. Nielsen, <jonasbn@cpan.org>',
    module_name          => 'Perl::Critic::Policy::Modules::ProhibitUseLib',
    license              => 'artistic',
    recursive_test_files => 0,
    create_makefile_pl   => 'traditional',
    create_readme        => 1,
    dist_abstract        => q[simple policy prohibiting the use of 'use lib'],
    requires => {
        'Data::Dumper' => '0', #Debugging
    },
    meta_merge => {
        resources => {
            homepage => 'http://logicLAB.jira.com/browse/PCPMPUL',
            repository => 'http://logicLAB.jira.com/svn/PCPMPUL',
        }
    },
);

$build->create_build_script();

1;
