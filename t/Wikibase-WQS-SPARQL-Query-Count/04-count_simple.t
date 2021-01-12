use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::WQS::SPARQL::Query::Count;

# Test.
my $obj = Wikibase::WQS::SPARQL::Query::Count->new;
my $property = 'P957';
my $isbn = '80-239-7791-1';
my $sparql = $obj->count_simple($property, $isbn);
my $right_ret = <<"END";
SELECT (COUNT(?item) as ?count) WHERE {
  ?item wdt:$property '$isbn'
}
END
is($sparql, $right_ret, 'Simple SPARQL count query.');
