/* Adapted from utl-psuedo-batch-personal-altair-slc-and-calling-slc-from-python-and-r.sas
   Original technique (per repo README/source): a DATA _NULL_ step reads inline
   CARDS4 text via INPUT/PUT _INFILE_ and writes it verbatim to an external .bat
   file, which the author then launches from R (system()) or Python (os.system())
   to pseudo-batch a personal Altair SLC session.

   Edits applied:
   1. The hardcoded Windows path c:/bat/wps.bat is redirected to a relative
      path (wps.bat) so the step is portable.
   2. CARDS4 (four-semicolon terminator) is swapped for CARDS with an explicit
      INFILE DATALINES statement ahead of the bare INPUT; -- same technique,
      documented SAS (INPUT statement, SAS 9.4 Language Reference: DATA Step
      Statements), same result. The write technique itself (FILE / INPUT /
      PUT _INFILE_ / CARDS) and the launcher script's shape are unchanged
      from the source repo. */

data _null_;
file "wps.bat";
infile datalines;
input;
put _infile_;
datalines;
@echo off
powershell -ExecutionPolicy Bypass -Command "Start-Process 'C:\Program Files\Altair\Analytics Workbench\2025\eclipse\workbench.exe'"
;
run;

data _null_;
infile "wps.bat";
input;
put _infile_;
run;

/* Read the written launcher back as a dataset (one row per line) and
   print it, so the run produces a visible listing in addition to the
   NOTEs above -- confirms wps.bat holds exactly the two lines written. */
data batfile;
infile "wps.bat";
length line $200;
input;
line = _infile_;
run;

proc print data=batfile noobs;
var line;
run;
