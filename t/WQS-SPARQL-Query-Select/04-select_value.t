use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use WQS::SPARQL::Query::Select;

# Test.
my $obj = WQS::SPARQL::Query::Select->new;
my $property_isbn = 'P957';
my $isbn = '80-239-7791-1';
my $sparql = $obj->select_value({$property_isbn => $isbn});
my $right_ret = <<"END";
SELECT ?item WHERE {
  ?item wdt:$property_isbn '$isbn'
}
END
is($sparql, $right_ret, 'SPARQL select query with one statement.');

# Test.
my $property_instance = 'P31';
my $instance = 'Q5';
$property_isbn = 'P957';
$isbn = '80-239-7791-1';
$sparql = $obj->select_value({
	$property_instance => $instance,
	$property_isbn => $isbn,
});
$right_ret = <<"END";
SELECT ?item WHERE {
  ?item wdt:$property_instance '$instance'
  ?item wdt:$property_isbn '$isbn'
}
END
is($sparql, $right_ret, 'SPARQL select query with two statements.');
