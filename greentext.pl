#!/usr/bin/perl
use warnings;
use strict;
use Irssi;

my %IRSSI = (
  version   => '0.1',
  author    => 'Amanda Folson',
  contact   => 'amanda@incredibl.org',
  name    => 'irssi-greentext',
  uri   => 'https://github.com/afolson/irssi-greentext',
  description => 'An irssi script that makes text prefixed with > green. >implying it would do something else.',
  license   => 'GPL',
);

sub greentext {
  my ($msg, $server, $witem) = @_;
  if ($msg =~ /^\>\s*/) {
    Irssi::signal_stop();
    Irssi::signal_remove('send text', 'greentext');
    Irssi::signal_emit('send text', "\x{03}3$msg", $server, $witem);
    Irssi::signal_add('send text', 'greentext');
  }
}

Irssi::signal_add('send text', 'greentext');
