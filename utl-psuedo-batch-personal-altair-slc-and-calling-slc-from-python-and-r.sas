%let pgm=utl-psuedo-batch-personal-altair-slc-and-calling-slc-from-python-and-r;

%stop_submission;

Psuedo batch personal altair slc and calling slc from python and r

https://tinyurl.com/3sy3sh5z
https://github.com/rogerjdeangelis/utl-psuedo-batch-personal-altair-slc-and-calling-slc-from-python-and-r

github
This is a proof of concept academic experiment.

CONTENTS

  1  Click on
     c:/bat/wps.bat

  2  Run inside R
     system('c:/bat/wps.bat');

  3  import os
     os.system(r'c:/bat/wps.bat')

  4  Related repos


SOAPBOX ON

I am new to eclipse so this may not be correct

ECLIPSE

  1 There appears the is no reasonable way to close eclipse programatically after your program has run. ENDSAS does nothing?
  2 Eclipse does not provide butons to clear log or  program. (it has some but they do not work)
  3 Cannot fix, dock, listing, program and log windows and have them dynamicall updated after a run (sas had this in the 1980s)
  4 It appears that the slc is very slow to open (600mb+ workbench eclipse footprint?, SLC is only 400+mb footprint)
  5 The first editions of the slc supported a CLI, later the CLI was removed.
    We did see the removal of some bloatware like the Altair HUB and that was a good thing, but did they remove the code from the workbench?
    I hope they bring the CLI back.

SOAPBOX OFF

  PROCESS

   1 Click on c:/bat/wps.bat

    a Create this batch file ( i could not figure out how continue a powershell command inside a batch file?

      data _null_;
      file "c:/bat/wps.bat";
      input;
      put _infile_;
      cards4;
      @echo off
      powershell -ExecutionPolicy Bypass -Command "Start-Process 'C:\Program Files\Altair\Analytics Workbench\2025\eclipse\workbench.exe'"
      ;;;;
      run;quit;

    b add this to the end of your autoexec

      %include 'the program you want to automatically execute(run batch, sortt of')

      After the inlcude

      options noerrorabend;
      options set=PYTHONHOME "D:\python310";
      proc python;
      submit;
      from tkinter import Tk, Button
      root = Tk()
      root.geometry("200x100")  # Set window size
      quit_button = Button(root, text="Quit", command=root.destroy)
      quit_button.pack(pady=20)
      root.mainloop()
      endsubmit;
      runquit;
      FYI Personal Altair SLC does not support sas window and %window

    c  When this pops up your code has been excuted

       +-------+
       | quit  |
       +-------+

       If it does not automaticaaly pop up look for it in the lower windows toolbar

       manually close eclipse

   2 Oprn RGui, R Commander or RStudio
     system('c:/bat/wps.bat');

   3 Open your favorite Python IDE
     import os
     os.system(r'c:/bat/wps.bat')

Select slc from d:/git/git_010_repos.sasbdat

RELATED REPO
---------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/setup-personal-edition-altair-slc-eclipse-workspace-config-sasautos-sasuser-saswork-autoexec
https://github.com/rogerjdeangelis/utl-altair-slc-to-fill-gaps-in-proc-sql-select-third-place-in-the-daily-double-r-python-solutions
https://github.com/rogerjdeangelis/utl-calling-python-from-personal-altair-slc-and-integrating-python-with-sql
https://github.com/rogerjdeangelis/utl-calling-r-from-personal-altair-slc-and-integrating-r-with-sql
https://github.com/rogerjdeangelis/utl-dropping-down-to-powershell-from-personal-altair-slc
https://github.com/rogerjdeangelis/utl-how-to-create-a-sas-dataset-from-python-panda-dataframe-using-the-personal-altair-slc
https://github.com/rogerjdeangelis/utl-how-to-create-a-sas-dataset-from-r-dataframe-using-the-personal-altair-slc

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
