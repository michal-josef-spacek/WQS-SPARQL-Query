use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Wikibase::WQS::SPARQL::Query::Count');
}

# Test.
require_ok('Wikibase::WQS::SPARQL::Query::Count');
