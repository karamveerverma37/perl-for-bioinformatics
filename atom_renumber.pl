# A programme for Atom renumbering in a .gro file written by Karamveer(BINC fellow, pondicherry university)
if(@ARGV ne ''){
	$filename=@ARGV[0];
}
else
{
	die "Usage: perl atom_renumber.pl .grofile";
}
open(FILE,$filename);
@file=<FILE>;
#print @file;
=i
   46ASP      N  724   1.907   3.172  10.919
=cut
$c=1;
foreach$line(@file){
	if($line=~/^((\s*)(\d+)(\w+)(\s+)(\w+))/){
		#@line1=split('\s+',$line);
		#$line1[3]="$c\t";
		#$c++;
		#$line2=join('',"@line1\n");
		#$line2=~s/\s+/\t/g;
		#push(@array,"$line2\n");	
		$column=substr($line,11,4);
		if($c<=9){
			substr($line,11,9,"$column    $c");
		}	
		elsif($c<=99){
			substr($line,11,9,"$column   $c");
		}		
		elsif($c<=999){
			substr($line,11,9,"$column  $c");
		}		
		elsif($c<=9999){
			substr($line,11,9,"$column $c");
		}		
	
		else{
			substr($line,11,9,"$column$c");
		}
		$c++;
		push(@array,$line);	
	}

}
print "enter your output filename\n";
$outfile=<stdin>;
open(OUT,">$outfile");
print OUT @array;
