#!/usr/bin/perl
use feature 'switch';
no warnings 'experimental';
$inputFile = 'input.txt';
$outputFile = 'output.txt';
open($fh, '<', $inputFile);
$data = do { local $/; <$fh> };
close $fh;
open($fh, '>', $outputFile);
@words = split(' ', $data);

foreach(@ARGV){
  #switch starts at 1 because string inputs match with 0
  given ($_) {
    when(1) {
      my $oldWord = $ARGV[(scalar @ARGV) - 2];
      my $newWord = $ARGV[(scalar @ARGV) - 1];
      replace($oldWord, $newWord);
    }
    when(2) {stats();}
    when(3) {charCt();}
    when(4) {lineCt();}
  }
}

close $fh;

sub replace {
  my $oldWord = @_[0];
  my $newWord = @_[1];
  #The sections surrouding oldWord are regex to deal with spaces and file start/end
  $data =~ s/(^|\s)$oldWord(?=(\s|$))/$1$newWord/g;
  print {$fh} "Updated data:\n$data\n";
  @words = split(' ', $data);
}

sub stats {
  %wordStats; #The next line makes use of perl's ++ instantiation of 0
  foreach (@words) {$wordStats{$_}++;}
  print {$fh} "Quantity of each word:\n";
  foreach (keys %wordStats){
    print {$fh} "$_: $wordStats{$_}\n";
  }
}

sub charCt {
  $charCount = length($data);
  print {$fh} "Number of characters is $charCount\n";
}

sub lineCt {
  @lines = split('\n', $data, -1);
  $lineCount = @lines;
  print {$fh} "Number of lines = $lineCount\n";
}
