use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $module = 'lib/Acme/USIG.pm';
WriteMakefile(
              'NAME'         => 'Acme::USIG',
              'VERSION_FROM' => $module, # finds $VERSION
              'dist'         => {
                                 COMPRESS=>'gzip -9f',
                                 SUFFIX=>'gz',
                                 DIST_DEFAULT => 'tardist'
                                },
              PM             => {
                                 'lib/Acme/USIG.pm'            => '$(INST_LIBDIR)/USIG.pm',
                                },
              $] >= 5.005 ? ('AUTHOR'   => 'Richard Clamp <richardc@unixbeard.net>',
                             'ABSTRACT' => 'Expresses an opinion on the strict pragma',

                            ) : ()

             );

use Config;
use File::Spec::Functions;
sub MY::postamble {
    my $perl     = $Config{perlpath};
    my $pod2text = catfile($Config{bin}, "pod2text");
    return <<EOF
README: $module
\t$perl $pod2text $module > README
EOF
}
