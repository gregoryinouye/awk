#!/usr/bin/awk -f

BEGIN {
	OFS="\t"
	FS=","
}

# skip header line
FNR > 1 {
	# Input file column headers: Status,Date,Description,Debit,Credit
	# Output file column order: Date,Amount,Category,Description,Additional Information
	printf $2 "\t";

	if ($5 != "") printf $5;
	else printf $4;
	
	print "", "", $3;
}
