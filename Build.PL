use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
        'Test::Requires' => 0,
    },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        'Text::MicroTemplate' => 0,
        'IPC::System::Simple' => 0,
        'parent'                        => '0',
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'App-cxxsetup',
    module_name => 'App::cxxsetup',

    script_files => ['cxxsetup'],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/' : 't/',
    recursive_test_files => 1,
   
    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
