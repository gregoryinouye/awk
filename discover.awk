#!/usr/bin/awk -f

BEGIN {
	OFS="\t"
	FS=","
}

# skip header line
FNR > 1 {
	# Input file column headers: Trans. Date,Post Date,Description,Amount,Category
	# Output file column order: Date,Amount,Category,Description,Additional Information
	# gsub("\r", "", $NF);

	print $1, $4, "", $3;
}
