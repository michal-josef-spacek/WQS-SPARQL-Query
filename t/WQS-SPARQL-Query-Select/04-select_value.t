use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use WQS::SPARQL::Query::Select;

# Test.
my $obj = WQS::SPARQL::Query::Select->new;
my $property = 'P957';
my $isbn = '80-239-7791-1';
my $sparql = $obj->select_value($property, $isbn);
my $right_ret = <<"END";
SELECT ?item WHERE {
  ?item wdt:$property '$isbn'
}
END
is($sparql, $right_ret, 'Simple SPARQL select query.');
