#!/usr/bin/awk -f

BEGIN {
	OFS="\t"
	FS=","
}

# skip header line
FNR > 1 {
	# Input file column headers: Transaction Date,Post Date,Description,Category,Type,Amount,Memo
	# Output file column order: Date,Amount,Category,Description,Additional Information
	print $1, -1 * $6, "", $3;
}
