#!/usr/bin/awk -f

BEGIN {
	OFS="\t"
	FS="\t"
}

{
	# remove unnecessary double quotes
	gsub("\"", "", $0)
}

# remove autopay payments
$4 ~ /(^AUTOPAY$)|(^INTERNET PAYMENT)|(^PAYMENT \- THANK YOU)|(^REWARD REDEMPTION CREDIT)|(^SMALL BALANCE CREDIT)/ { next }

# Input file column order: Date,Amount,Category,Description,Additional Information
# categorize common transactions
$4 ~ /(^ADIDAS)|(^DSW)|(^MADEWELL)|(SP \* OUTDOOR VOICES)|(^ROSS STORES)|(^SweatyBetty)|(^UNIQLO)|(^ZAP\*ZAPPOS)|(^Zappos)/ { $3="Clothing" }
$4 ~ /(^Kindle Svcs)|(LEANPUB)/ { $3="Entertainment" }
#$4 ~ /(^)/ { $3="Gift" }
$4 ~ /(^KAISER)|(Optometry)/ { $3="Medical" }
$4 ~ /(^CVS)|(^GLOSSIER)|(^GREATKUTS)|(^WWW\.SALLYBEAUTY)|(^ULTA)|(^VERSAILLES)/ { $3="Personal Care" }
$4 ~ /(^BHN\*GIFTCARDS\.COM)/ { $3="Expense Other" }
$4 ~ /(^DOORDASH)/ { $3="Dining Out" }
$4 ~ /(^BERKELEY BOWL)|(^BEVERAGES \& MORE)|(^CLANCY\'S)|(COSTCO)|(^H-E-B)|(^MV MARKET)|(^PAK N SAVE)|(^SAFEWAY)|(^TRADER JOE\'S)|(^WAL-MART)|(^YAOYA SAN)/ { $3="Groceries" }
#$4 ~ /(^)/ { $3="Internet" }
$4 ~ /(^PG&E)/ { $3="Power" }
#$4 ~ /(^)/ { $3="Water" }
#$4 ~ /(^)/ { $3="HOA Dues" }
#$4 ~ /(^)/ { $3="Homeowner's Insurance" }
#$4 ~ /(^)/ { $3="Mortgage" }
$4 ~ /(^CHEWY)|(^PET )|(PETSMART)|(VETERINARY)/ { $3="Pet" }
$4 ~ /(^DAISO)|(^THE HOME DEPOT)|(^IKEA)/ { $3="Home Other" }
$4 ~ /(AUTOMOTIVE)|(^SQ \*KAADY CAR WASHES)|(^STATE OF CALIF DMV)|(^CA DMV FEE)/ { $3="Auto Upkeep" }
#$4 ~ /(^)/ { $3="Auto Insurance" }
$4 ~ /(^76 )|(^CHEVRON)|(^VALERO)/ { $3="Gas" }
#$4 ~ /(^)/ { $3="Parking" }
$4 ~ /(^SOUTHWEST)/ { $3="Travel" }
$4 ~ /(BRIGHTFUNDS)/ { $3="Tithe" }

{ print }

