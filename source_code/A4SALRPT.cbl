       identification division.
       program-id. A4SALRPT.
       date-written. 2024-06-14.
       author. Talent Nyota.
      * Description:
      *  Printing an employee salary report, and calculating
      *  average increases.
      *
       environment division.
       configuration section.
      *
       input-output section.
      *
       file-control.
      * input-file declaration
           select input-file
               assign to INFILE
               organization is sequential.
      *
      * output-file declaration
           select output-file
               assign to OUTFILE
               organization is sequential.
      *
       data division.
       file section.
      *
       fd input-file
           recording mode is F
           data record is input-line
           record contains 28 characters.
      *
       01 input-line.
           05 il-nbr                            pic 999.
           05 il-name                           pic x(15).
           05 il-ed-code                        pic x.
           05 il-years                          pic 99.
           05 il-salary                         pic 9(5)v99.
      *
       fd output-file
           recording mode is F
           data record is output-line
           record contains 98 characters.
      *
       01 output-line                           PIC X(98).
      *
       working-storage section.

       01 ws-blank-line.
          05 filler                             pic x(98).

      *Headings
       01 ws-report-name.
          05 filler                             pic x(64)
                value spaces.
          05 filler                             pic x(34)
                value "Miguel Stoyke, A4".

       01 ws-report-heading.
           05 filler                            pic x(29)
                value spaces.
           05 filler                            pic x(22)
                value "EMPLOYEE SALARY REPORT".
           05 filler                            pic x(14)
                value spaces.
           05 filler                            pic x(4)
                value "PAGE".
           05 filler                            pic x(2)
                value spaces.
           05 ws-page-number                    pic zz9.


       01 ws-column-heading-1.
           05 filler                            pic x(3)
                value "EMP".
           05 filler                            pic x(2)
                value spaces.
           05 filler                            pic x(3)
                value "EMP".
           05 filler                            pic x(28)
                value spaces.
           05 filler                            pic x(7)
                value "PRESENT".
           05 filler                            pic x(2)
                value spaces.
           05 filler                            pic x(8)
                value "INCREASE".
           05 filler                            pic x(5)
                value spaces.
           05 filler                            pic x(3)
                value "PAY".
           05 filler                            pic x(11)
                value spaces.
           05 filler                            pic x(3)
                value "NEW".
           05 filler                            pic x(4)
                value spaces.

       01 ws-column-heading-2.
           05 filler                            pic x(3)
                value "NUM".
           05 filler                            pic x(2)
                value spaces.
           05 filler                            pic x(4)
                value "NAME".
           05 filler                            pic x(10)
                value spaces.
           05 filler                            pic x(5)
                value "YEARS".
           05 filler                            pic x(1)
                value spaces.
           05 filler                            pic x(8)
                value "POSITION".
           05 filler                            pic x(4)
                value spaces.
           05 filler                            pic x(6)
                value "SALARY".
           05 filler                            pic x(5)
                value spaces.
           05 filler                            pic x(1)
                value "%".
           05 filler                            pic x(7)
                value spaces.
           05 filler                            pic x(8)
                value "INCREASE".
           05 filler                            pic x(7)
                value spaces.
           05 filler                            pic x(6)
                value "SALARY".
           05 filler                            pic x(2)
                value spaces.

       01 ws-class-heading.
           05 filler                            pic x(15)
                value "EMPLOYEE CLASS:".
           05 filler                            pic x(8)
                value spaces.
           05 filler                            pic x(7)
                value "Analyst".
           05 filler                            pic x(4)
                value spaces.
           05 filler                            pic x(8)
                value "Sen Prog".
           05 filler                            pic x(4)
                value spaces.
           05 filler                            pic x(4)
                value "Prog".
           05 filler                            pic x(4)
                value spaces.
           05 filler                            pic x(7)
                value "Jr Prog".
           05 filler                            pic x(4)
                value spaces.
           05 filler                            pic x(12)
                value "Unclassified".

       01 ws-counters-output.
           05 filler                            pic x(15)
                value "# ON THIS PAGE:".
           05 filler                            pic x(12)
                value spaces.
           05 ws-analyst-count-out              pic zz9.
           05 filler                            pic x(9)
                value spaces.
           05 ws-sr-prog-count-out              pic zz9.
           05 filler                            pic x(5)
                value spaces.
           05 ws-prog-count-out                 pic zz9.
           05 filler                            pic x(8)
                value spaces.
           05 ws-jr-prog-count-out              pic zz9.
           05 filler                            pic x(13)
                value spaces.
           05 ws-unclassified-count-out         pic zz9.

       01 ws-averageincs-output.
           05 filler                            pic x(18)
                value "AVERAGE INCREASES:".
           05 filler                            pic x(3)
                value spaces.
           05 filler                            pic x(8)
                value "ANALYST=".
           05 ws-avg-analyst-out                pic zzz,zzz,zz9.99.
           05 filler                            pic x(5)
                value spaces.
           05 filler                            pic x(9)
                value "SEN PROG=".
           05 ws-avg-sr-prog-out                pic zzz,zzz,zz9.99.

       01 ws-averageincs-output-2.
           05 filler                            pic x(21)
                value spaces.
           05 filler                            pic x(5)
                value "PROG=".
           05 filler                            pic x(3)
                value spaces.
           05 ws-avg-prog-out                   pic zzz,zzz,zz9.99.
           05 filler                            pic x(5)
                value spaces.
           05 filler                            pic x(8)
                value "JR PROG=".
           05 filler                            pic x(1)
                value spaces.
           05 ws-avg-jr-prog-out                pic zzz,zzz,zz9.99.

      *Constants/Counters
       77 ws-analyst                            pic x(7)
           value "ANALYST".
       77 ws-sen-prog                           pic x(8)
           value "SEN PROG".
       77 ws-prog                               pic x(4)
           value "PROG".
       77 ws-jr-prog                            pic x(7)
           value "JR PROG".

       77 ws-lit-graduate                       pic x
                value "G".
       77 ws-lit-non-graduate                   pic x
                value "N".

       77 ws-perc-analyst                       pic 99v9
           value 13.8.
       77 ws-perc-sen-prog                      pic 99v9
           value 10.3.
       77 ws-perc-jr-prog                       pic 99v9
           value 4.2.
       77 ws-perc-prog                          pic 99v9
           value 7.7.

       77 ws-lines-per-page                     pic 999
           value 10.
       77 ws-line-count                         pic 999
           value 0.
       77 ws-page-count                         pic 999
           value 0.

       77 ws-eof-flag                           pic x
           value "N".
       77 ws-lit-yes                            pic x
           value "Y".

       01 ws-counters.
           05 ws-analyst-count                  pic 99
                value 0.
           05 ws-analyst-tot-count              pic 99
                value 0.
           05 ws-sr-prog-count                  pic 99
                value 0.
           05 ws-sr-prog-tot-count              pic 99
                value 0.
           05 ws-prog-count                     pic 99
                value 0.
           05 ws-prog-tot-count                 pic 99
                value 0.
           05 ws-jr-prog-count                  pic 99
                value 0.
           05 ws-jr-prog-tot-count              pic 99
                value 0.
           05 ws-unclassified-count             pic 99
                value 0.

      *Detail line/Calculations
       01 ws-detail-output.
           05 ws-emp-num                        pic x(3).
           05 filler                            pic x(2).
           05 ws-emp-name                       pic x(15).
           05 filler                            pic x(2).
           05 ws-years                          pic z9.
           05 filler                            pic x(2).
           05 ws-position                       pic x(8).
           05 ws-curr-salary                    pic zzz,zz9.99.
           05 filler                            pic x(1).
           05 ws-percent-inc                    pic zzz.z.
           05 ws-percent-sign                   pic x
                value "%".
           05 filler                            pic x(1).
           05 ws-salary-increase                pic $,$$$,$$9.99+.
           05 filler                            pic x(3).
           05 ws-new-salary                     pic $z,zzz,zz9.99.

       01 ws-calc.
           05 ws-pay-increase-total-analyst     pic 9(10)v99
                  value 0.
           05 ws-pay-increase-total-senprog     pic 9(10)v99
                  value 0.
           05 ws-pay-increase-total-prog        pic 9(10)v99
                  value 0.
           05 ws-pay-increase-total-jrprog      pic 9(10)v99
                  value 0.
           05 ws-average-analyst                pic 9(10)v99
                  value 0.
           05 ws-average-senprog                pic 9(10)v99
                  value 0.
           05 ws-average-prog                   pic 9(10)v99
                  value 0.
           05 ws-average-jrprog                 pic 9(10)v99
                  value 0.
           05 ws-incr-rate-calc                 pic 99v9
                value 0.
           05 ws-incr-salary-calc               pic 9(8)v99
                value 0.
           05 ws-new-salary-calc                pic 9(6)v99
                value 0.

      *
       procedure division.
       000-main.

           perform 100-openfiles.
           perform 200-initialread.
           perform 300-processpages
                until ws-eof-flag = ws-lit-yes.
           perform 700-averageincreases.
           perform 800-closefiles.
      *
           goback.

      *Open input and output files
       100-openfiles.
           open input input-file.
           open output output-file.

      *Initial read statement
       200-initialread.
           read input-file
                at end move ws-lit-yes          to ws-eof-flag.

      *Write the heading, process the output lines in a for loop,
      *and print the subtotals (counters on each page).
       300-processpages.
           perform 320-writeheadings.
           perform 340-processlines
                varying ws-line-count           from 1 by 1
                until ws-line-count > ws-lines-per-page
                OR ws-eof-flag = ws-lit-yes.
           perform 600-subtotals.

      *Write headings, and include my name at the top if it is the first
      *page. Also adds a page number on each page.
       320-writeheadings.
           add 1                                to ws-page-count.
           move ws-page-count                   to ws-page-number.

           if ws-page-count > 1
                write output-line               from ws-blank-line
                move spaces                     to output-line
                write output-line               from ws-report-heading
                move spaces                     to output-line
                write output-line               from ws-blank-line
                move spaces                     to output-line
                write output-line               from ws-column-heading-1
                move spaces                     to output-line
                write output-line               from ws-column-heading-2
                move spaces                     to output-line
                write output-line               from ws-blank-line
                move spaces                     to output-line
           else
                write output-line               from ws-report-name
                move spaces                     to output-line
                write output-line               from ws-blank-line
                move spaces                     to output-line
                write output-line               from ws-report-heading
                move spaces                     to output-line
                write output-line               from ws-blank-line
                move spaces                     to output-line
                write output-line               from ws-column-heading-1
                move spaces                     to output-line
                write output-line               from ws-column-heading-2
                move spaces                     to output-line
                write output-line               from ws-blank-line
                move spaces                     to output-line
           end-if.

      *Reset calc variables, and determines employee calculations/output
      *based on graduate or non-graduate. Moves data to output-line.
       340-processlines.
           move 0                               to ws-incr-rate-calc,
                                                   ws-incr-salary-calc,
                                                   ws-new-salary-calc
           if il-ed-code = ws-lit-graduate
                perform 400-graduates
           else
                perform 500-nongraduates
           end-if.

           move il-nbr                          to ws-emp-num.
           move il-name                         to ws-emp-name.
           move il-years                        to ws-years.
           move il-salary                       to ws-curr-salary.
           move ws-incr-rate-calc               to ws-percent-inc.
           move ws-incr-salary-calc             to ws-salary-increase.
           move ws-new-salary-calc              to ws-new-salary.



           write output-line                    from ws-detail-output.
           move spaces                          to output-line.

      *Second read statement
           read input-file
               at end move ws-lit-yes           to ws-eof-flag.

      *Performs calculations based on years worked and employee type.
       400-graduates.
           if il-years > 15
                move ws-analyst                 to ws-position
                move ws-perc-analyst            to ws-incr-rate-calc
                compute ws-incr-salary-calc rounded =
                    (ws-incr-rate-calc * il-salary) / 100
                move "%"                        to ws-percent-sign
                add 1                           to ws-analyst-count
                add 1                           to ws-analyst-tot-count
                add ws-incr-salary-calc         to
                                          ws-pay-increase-total-analyst

                compute ws-new-salary-calc = ws-incr-salary-calc
                    + il-salary
           else
           if il-years >= 7 and il-years <= 15
                move ws-sen-prog                to ws-position
                move ws-perc-sen-prog           to ws-incr-rate-calc
                compute ws-incr-salary-calc rounded =
                    (ws-incr-rate-calc * il-salary) / 100
                move "%"                        to ws-percent-sign
                add 1                           to ws-sr-prog-count
                add 1                           to ws-sr-prog-tot-count
                add ws-incr-salary-calc         to
                                          ws-pay-increase-total-senprog

                compute ws-new-salary-calc = ws-incr-salary-calc
                    + il-salary

           else
           if il-years < 7 and il-years > 2
                move ws-prog                    to ws-position
                move ws-perc-prog               to ws-incr-rate-calc
                compute ws-incr-salary-calc rounded =
                    (ws-incr-rate-calc * il-salary) / 100
                move "%"                        to ws-percent-sign
                add 1                           to ws-prog-count
                add 1                           to ws-prog-tot-count
                add ws-incr-salary-calc         to
                                          ws-pay-increase-total-prog

                compute ws-new-salary-calc = ws-incr-salary-calc
                    + il-salary

           else
           if il-years <= 2
                move spaces                     to ws-position
                move spaces                     to ws-percent-sign
                move il-salary                  to ws-new-salary-calc
                add 1                           to ws-unclassified-count


           end-if
           end-if
           end-if
           end-if.

      *Performs calculations based on years worked and employee type.
       500-nongraduates.
           if il-years > 10
               move ws-prog                     to ws-position
               move ws-perc-prog                to ws-incr-rate-calc
               compute ws-incr-salary-calc rounded =
                   (ws-incr-rate-calc * il-salary) / 100
               move "%"                         to ws-percent-sign
               add 1                            to ws-prog-count
               add 1                            to ws-prog-tot-count
               add ws-incr-salary-calc          to
                                          ws-pay-increase-total-prog

               compute ws-new-salary-calc = ws-incr-salary-calc
                   + il-salary
            else
            if il-years <= 10 and il-years > 4
               move ws-jr-prog                  to ws-position
               move ws-perc-jr-prog             to ws-incr-rate-calc
               compute ws-incr-salary-calc rounded =
                   (ws-incr-rate-calc * il-salary) / 100
               move "%"                         to ws-percent-sign
               add 1                            to ws-jr-prog-count
               add 1                            to ws-jr-prog-tot-count
               add ws-incr-salary-calc          to
                                          ws-pay-increase-total-jrprog

               compute ws-new-salary-calc = ws-incr-salary-calc
                   + il-salary
            else
            if il-years <= 4
                move spaces                     to ws-position
                move spaces                     to ws-percent-sign
                move il-salary                  to ws-new-salary-calc
                add 1                           to ws-unclassified-count


           end-if
           end-if
           end-if.

      *Print the employee type counters on the output-line.
       600-subtotals.
           move ws-analyst-count                to ws-analyst-count-out.
           move 0                               to ws-analyst-count.
           move ws-sr-prog-count                to ws-sr-prog-count-out.
           move 0                               to ws-sr-prog-count.
           move ws-prog-count                   to ws-prog-count-out.
           move 0                               to ws-prog-count.
           move ws-jr-prog-count                to ws-jr-prog-count-out.
           move 0                               to ws-jr-prog-count.
           move ws-unclassified-count           to
                                              ws-unclassified-count-out.
           move 0                               to
                                                  ws-unclassified-count.

           write output-line                    from ws-blank-line.
           move spaces                          to output-line.
           write output-line                    from ws-class-heading.
           move spaces                          to output-line.
           write output-line                    from ws-counters-output.
           move spaces                          to output-line.
           write output-line                    from ws-blank-line.

      *Calculates average increases for the total amount of each
      *employee type. Moves data to the output-line.
       700-averageincreases.
           compute ws-average-analyst rounded =
                ws-pay-increase-total-analyst / ws-analyst-tot-count.
           compute ws-average-senprog rounded =
                ws-pay-increase-total-senprog / ws-sr-prog-tot-count.
           compute ws-average-jrprog rounded =
                ws-pay-increase-total-jrprog / ws-jr-prog-tot-count.
           compute ws-average-prog rounded =
                ws-pay-increase-total-prog / ws-prog-tot-count.

           move ws-average-analyst              to ws-avg-analyst-out.
           move ws-average-senprog              to ws-avg-sr-prog-out.
           move ws-average-jrprog               to ws-avg-jr-prog-out.
           move ws-average-prog                 to ws-avg-prog-out.

           write output-line                    from
                                                  ws-averageincs-output.
           move spaces                          to output-line.
           write output-line                    from
                                                ws-averageincs-output-2.
           write output-line                    from ws-blank-line.
           move spaces                          to output-line.

      *Close files statement.
       800-closefiles.
           close input-file,
                 output-file.

      *
       end program A4SALRPT.