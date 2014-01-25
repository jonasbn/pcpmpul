# Build.PL for Perl::Critic::JONASBN

# $Id$

use strict;
use Module::Build;

my $build = Module::Build->new(
    dist_author          => 'Jonas B. Nielsen, <jonasbn@cpan.org>',
    module_name          => 'Perl::Critic::Policy::logicLAB::ProhibitUseLib',
    license              => 'artistic',
    recursive_test_files => 0,
    create_makefile_pl   => 'traditional',
    create_readme        => 1,
    dist_abstract        => q[simple policy prohibiting the use of 'use lib'],
    requires => {
        'Perl::Critic'        => '0',
        'Perl::Critic::Utils' => '0',
        'Readonly'            => '0',
        'Test::More'          => '0',
        'Test::Perl::Critic'  => '0',
    },
    meta_merge => {
        resources => {
            homepage => 'http://logiclab.jira.com/wiki/display/PCPMPUL/Home',
            bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Perl-Critic-Poilcy-logicLAB-Prohibit-UseLib',
            repository => 'https://github.com/jonasbn/pcpmpul',
            ProjectChangelog =>
                'http://logiclab.jira.com/browse/PCPMPUL#selectedTab=com.atlassian.jira.plugin.system.project%3Achangelog-panel',
            ProjectSite => 'http://logicLAB.jira.com/browse/PCPMPUL',
            ProjectWiki => 'http://logiclab.jira.com/wiki/display/PCPMPUL/Home',
        }
    },
);

$build->create_build_script();

1;
