use strict;
use warnings;


package WebService::Amazon::Route53::Caching::Store::DBM;


use DB_File;



=begin doc

Constructor.  Save the filename away.

=end doc

=cut

sub new
{
    my ( $proto, %supplied ) = (@_);
    my $class = ref($proto) || $proto;

    my $self = {};

    $self->{ '_path' } = $supplied{ 'path' };
    bless( $self, $class );
    return $self;
}



=begin doc

Tie, set, and untie the backing-store.

=end doc

=cut

sub set
{
    my ( $self, $key, $val ) = (@_);

    #
    #  Here we tie, get, and untie.
    #
    #  We need to explicitly untie to force a cache flush.
    #
    my %h;
    tie %h, "DB_File", $self->{ '_path' }, O_RDWR | O_CREAT, 0666, $DB_HASH or
      return;

    $h{ $key } = $val;
    untie(%h);
}



=begin doc

Tie, get, and untie the backing-store.

=end doc

=cut

sub get
{
    my ( $self, $key ) = (@_);

    #
    #  Here we tie, get, and untie.
    #
    #  We need to explicitly untie to force a cache flush.
    #
    my %h;
    tie %h, "DB_File", $self->{ '_path' }, O_RDWR | O_CREAT, 0666, $DB_HASH or
      return;

    my $ret = $h{ $key };
    untie(%h);

    return ($ret);
}



=begin doc

Tie, unset, and untie the backing-store.

=end doc

=cut

sub del
{
    my ( $self, $key ) = (@_);

    #
    #  Here we tie, get, and untie.
    #
    #  We need to explicitly untie to force a cache flush.
    #
    my %h;
    tie %h, "DB_File", $self->{ '_path' }, O_RDWR | O_CREAT, 0666, $DB_HASH or
      return;

    delete $h{ $key };
    untie(%h);
}



1;
