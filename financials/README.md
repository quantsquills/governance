Financials
==========

We use a git repository stored on GitHub to record our financials. This helps us meet two important goals:

1.	The git commit log serves as a clear audit-trail.
2.	Hosting on GitHub provides transparency for members and supporters.

This `ledger.dat` file is plain text file formatted as per the [ledger-cli](http://ledger-cli.org/) tool.

Formatting
----------

The file should follow most of the defaults as per the [ledger documentation](http://ledger-cli.org/3.0/doc/ledger3.html).

We try to use indentation sensibly to keep the file readable and try to have transactions roughly in date order (though this is unnecessary because transactions are re-ordered by reporting tools built into ledger).

Transactions should be marked as cleared (`*`) or pending (`!`) if that's what they are. See the docs on [transaction state](http://ledger-cli.org/3.0/doc/ledger3.html#Transaction-state).

Reporting
---------

There's a simple script which runs a couple of basic reports and generates the [report.md](https://github.com/quantsquills/governance/tree/master/financials/report.md) file. Otherwise, you can run the reports manually.

-	Account balances: `ledger -f ledger.dat balance`
-	List of uncleared transactions: `ledger -f ledger.dat register --uncleared`
