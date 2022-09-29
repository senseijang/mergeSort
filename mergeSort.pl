# Andy Jang
# CSCI 355
# 25 September 2022

use strict;
use warnings;

# merge the subarrays together
sub merge {
  my ($cmp, $left, $right) = @_;
  my @merged;

  # while left and right array aren't empty
  while (@$left && @$right) {
      # running comparison and dereferencing using ->
      if ($cmp->($left->[0], $right->[0]) <= 0) {
          push @merged, shift @$left;
      } else {
          push @merged, shift @$right;
      }
  }
  # account for leftovers in the arrays
  if (@$left) {
      push @merged, @$left;
  } else {
      push @merged, @$right;
  }
  return @merged;
}

# takes in the comparsion function and array to be sorted.
sub merge_sort {
  my ($cmp, $array) = @_;

  return @$array if @$array <= 1;

  # middle index of the array
  my $mid = @$array/2 - 1;

  # use recursion to sort the subarrays
  my @left  = merge_sort($cmp, [@{$array}[0 .. $mid]]);
  my @right = merge_sort($cmp, [@{$array}[$mid+1 .. $#{$array}]]);

  # merge the array together
  if ($left[-1] > $right[0]) {
      @left = merge $cmp, \@left, \@right;
  } else {
      push @left, @right;
  }
  return @left;    
}

# The comparison operator for merge_sort, returns whatever is bigger.
# Sort of similar to anonymous functions with the syntax.
my $cmp = sub {
  my ($x, $y) = @_;
  return $x <=> $y;
};

# Gets user input
sub get_user_input {
  my @userarr = ();
  my $userInput = 0; 
  my ($keepGoing, $count) = 1;

  print "Please enter 10 numbers to be sorted\n";
  while ($keepGoing) {
    print "Enter a number: ";
    $userInput = <>;
    chomp($userInput);
    $count += 1;

    if ($userInput == -1 || $count == 10) {
      push @userarr, $userInput;
      $keepGoing = 0;
    } else {
      push @userarr, $userInput;
    }
  }
  return @userarr;
}

print join(", ", merge_sort $cmp, [get_user_input]), "\n";
