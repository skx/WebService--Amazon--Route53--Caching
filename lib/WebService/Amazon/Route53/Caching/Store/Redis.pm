
package WebService::Amazon::Route53::Caching::Store::Redis;

use strict;
use warnings;



=begin doc

Constructor, just save the Redis handle away.

=end doc

=cut

sub new
{
    my ( $proto, %supplied ) = (@_);
    my $class = ref($proto) || $proto;

    my $self = {};

    $self->{ '_handle' } = $supplied{ 'redis' };
    bless( $self, $class );
    return $self;
}



=begin doc

Set a given value to the named key.

=end doc

=cut

sub set
{
    my ( $self, $key, $val ) = (@_);

    return ( $self->{ '_handle' }->set( $key, $val ) );
}



=begin doc

Fetch the value from a given key.

=end doc

=cut

sub get
{
    my ( $self, $key ) = (@_);

    return ( $self->{ '_handle' }->get($key) );
}



=begin doc

Delete the value associated with the given key.

=end doc

=cut

sub del
{
    my ( $self, $key ) = (@_);

    return ( $self->{ '_handle' }->del($key) );
}



1;
