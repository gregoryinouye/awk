#!/usr/bin/awk -f

BEGIN {
	OFS="\t"
	FS=","
}

# skip header line
FNR > 1 {
	# Input file column headers: Date,Transaction,Name,Memo,Amount
	# Output file column order: Date,Amount,Category,Description,Additional Information

	gsub("\"", "", $5);

	print $1, -1 * $5, "", $3;
}
