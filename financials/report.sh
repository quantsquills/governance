## Generate a financial report report.

printf "This report is *automatically generated* you should not edit it manually.\n" > report.md
printf "# Account balances\n\n\`\`\`txt\n" >> report.md
ledger -f ledger.dat balance -w >> report.md
printf "\`\`\`\n\n" >> report.md
printf "# Uncleared transactions\n\n\`\`\`txt\n" >> report.md
ledger -f ledger.dat register -w --uncleared >> report.md
printf "\`\`\`\n\n" >> report.md
printf "\n\n*Generated on $(date)*." >> report.md