use strict;
use warnings;

use Test::More 'tests' => 4;
use Test::NoWarnings;
use WQS::SPARQL::Query::Select;

# Test.
my $obj = WQS::SPARQL::Query::Select->new;
my $property_isbn = 'P957';
my $isbn = '80-239-7791-1';
my $sparql = $obj->select_value({$property_isbn => $isbn});
my $right_ret = <<"END";
SELECT ?item WHERE {
  ?item wdt:$property_isbn '$isbn'.
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
  ?item wdt:$property_instance wd:$instance.
  ?item wdt:$property_isbn '$isbn'.
}
END
is($sparql, $right_ret, 'SPARQL select query with two statements.');

# Test.
$property_instance = 'P31';
$instance = 'Q2085381';
my $property_official_name = 'P1448';
my $official_name = 'LIBRI, spol. s r.o.';
my $official_name_lang = 'cs';
$sparql = $obj->select_value({
	$property_instance => $instance,
	$property_official_name => $official_name.'@'.$official_name_lang,
});
$right_ret = <<"END";
SELECT ?item WHERE {
  ?item wdt:$property_instance wd:$instance.
  ?item wdt:$property_official_name '$official_name'\@$official_name_lang.
}
END
is($sparql, $right_ret, 'SPARQL select query with multilingual text.');
