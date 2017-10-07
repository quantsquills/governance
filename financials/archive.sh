## Archive a financial year

if [ $# -eq 0 ]
  then
    echo "No year specified"
		exit 1
fi

to=$1
from=$[to - 1]

# First we need to extract all entries before the end of the financial year in question into its own file.
printf "; An archived ledger for financial year $from-$to\n\n" > "archive/ledger-$from-$to.dat"
ledger -f ledger.dat -e "$to-07-01" print --date-format "%Y-%m-%d" >> "archive/ledger-$from-$to.dat"

# A copy of any entries after the end of the financial year to retain in the new main ledger
after=`ledger -f ledger.dat -b $to-07-01 print --date-format "%Y-%m-%d"`
# Calculate the opening balances from the now archived FY ledger
equity=`ledger -f "archive/ledger-$from-$to.dat" equity --date-format "%Y-%m-%d"`

# Construct the new ledger file
printf "; This is the general ledger.\n\n" > ledger.dat
echo "${equity}" >> ledger.dat
printf "\n" >> ledger.dat
echo "${after}" >> ledger.dat
