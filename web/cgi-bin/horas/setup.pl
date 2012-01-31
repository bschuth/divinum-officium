#!/usr/bin/perl

use strict;

use utf8;
# vim: set encoding=utf-8 :

# Name : Laszlo Kiss
# Date : 01-20-08
# Divine Office setup


#*** setuptable($command)
# prints and handles $command item from horas.dialog hash (in www/horas folder)
# using horas.setup hash also from www/horas folder
sub setuptable
{
  our %setup;
  our $input;
  our $command;

  $command = shift;
  my $title1 = our $title;
  $title1 =~ s/setup/options/i;

  #*** set input table
  eval("$setup{$command}");
  setup($command, getsetuppar($command));

  print << "PrintTag";
<H1 ALIGN=CENTER><FONT COLOR=MAROON><B><I>$title1</I></B></FONT></H1>
<TABLE WIDTH=75% BORDER=0 ALIGN=CENTER><TR><TD>
$input
</TD></TR></TABLE>
<P ALIGN=CENTER>
<INPUT TYPE=SUBMIT NAME='button' VALUE=O.K.>
</P>
PrintTag

  $command = 'change' . $command;
}

1;
