CREATE OR REPLACE FUNCTION jobcenter.do_switchcasecode(code text, args jsonb, vars jsonb)
 RETURNS text
 LANGUAGE plperlu
AS $function$

use strict;
use warnings;
use lib '/home/wieger/src/jobcenter/lib';
use JSON::MaybeXS;
use JobCenter::Safe;

my $safe = new JobCenter::Safe;

my ($code, $jargs, $jvars) = @_;

our %a = %{decode_json($jargs // '{}')};
our %v = %{decode_json($jvars // '{}')};

$safe->share(qw(%a %v %i));

my $res = $safe->reval($code, 1);

die "$@" if $@;

return "$res";

$function$
