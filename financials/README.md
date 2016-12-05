Financials
==========

We use a git repository stored on GitHub to record our financials. This helps us meet two important goals:

1.	The git commit log serves as a clear audit-trail.
2.	Hosting on GitHub provides transparency for members and supporters.

This `ledger.dat` file is plain text file formatted as per the [ledger-cli](http://ledger-cli.org/) tool.

There's a simple script which runs a couple of basic reports and generates the [report.md](https://github.com/quantsquills/governance/tree/master/financials/report.md) file. Otherwise, you can run the reports manually.

-	Account balances: `ledger -f ledger.dat balance`
-	List of uncleared transactions: `ledger -f ledger.dat register --uncleared`
