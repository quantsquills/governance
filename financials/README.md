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

# End of financial year

We archive the ledger and start a fresh one for each financial year to ensure the whole thing remains tidy and the reports continue to make sense. A couple of notes:

- there shouldn't be any transactions in the main ledger file for dates before the beginning of the financial year being closed. If there are, do this procedure for the prior year first.
- you should make sure all transactions are cleared before doing this. If they're not—wait a few days.

## 1. Closing entries

First we need to add [closing entries](https://accountingexplained.com/financial/cycle/closing-entries) to transfer the balance of all income and expense accounts to 'Retained Earnings'. Closing entries should be dated the final day of the financial year.

A balance command will show you the entries you need to make. For example:

```
$ ledger -f ledger.dat -e 2016-07-01 balance
            $1100.33  Expenses
            $1097.41    Catering
               $2.92    Stationary
           $-1064.35  Income
            $-997.80    Sponsorship
            $-397.80      Sponsor 1
            $-600.00      Sponsor 2
             $-35.98  Liabilities
            $-269.70    Supplier 1
--------------------
                   0
```

This would require closing entries of:

```
2016-06-30 * Closing entries
    Expenses:Catering                      $-1097.41
    Expenses:Stationary                       $-2.92
    Income:Sponsorship:Sponsor 1             $397.80
    Income:Sponsorship:Sponsor 2             $600.00
    Retained earnings
```

## 2. Archive ledger

Now create the new ledger. There's a script for this. Simply run (e.g.) `./archive.sh 2016`.

For details about what the script is doing, refer to [the script itself](/quantsquills/governance/tree/master/financials/archive.sh) or `ledger` documentation for [archiving transactions](http://ledger-cli.org/3.0/doc/ledger3.html#Archiving-Previous-Years)
