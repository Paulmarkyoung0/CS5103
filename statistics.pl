#!/usr/bin/perl
$inputFile = 'input.txt';
$outputFile = 'output.txt';
open($fh, '<', $inputFile);
$data = do { local $/; <$fh> };
close $fh;
open($fh, '>', $outputFile);

@words = split(' ', $data);
%wordStats;
foreach (@words) {
  $wordStats{$_}++;
}
print {$fh} "Quantity of each word:\n";
foreach (keys %wordStats){
  print {$fh} "$_: $wordStats{$_}\n";
}

#Additional Features to be added
# $charCount = length($data);
# print {$fh} "Number of characters is $charCount\n";

# @lines = split('\n', $data, -1);
# $lineCount = @lines;
# print {$fh} "Number of lines = $lineCount\n";

close $fh;