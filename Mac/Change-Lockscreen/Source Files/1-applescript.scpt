#!/usr/bin/osascript

# Copyright (C) 2020  Andrew Larson (thealiendrew@gmail.com)
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

on run {input, parameters}

  set appTitle to "Change Lockscreen"
  set scriptFile to (path to me)
  set firstItem to (first item of input)

  -- when we haven't picked a file, it defaults to the app file
  if firstItem is scriptFile then
    set pickedFile to (choose file with prompt "Please select an image to use as your lockscreen" of type {"public.png","public.jpeg","public.tiff","com.apple.pict"} default location (path to pictures folder))

    -- continue if we selected a file
    if pickedFile = {} then
      -- tends to not end up here when pressing cancel on the choose dialog
      set firstItem to false
      try
        tell app "Finder"
          activate
          display dialog "No file choosen, lockscreen unchanged." with title appTitle
        end tell
      end try
    else
      set firstItem to POSIX path of pickedFile
      return firstItem
    end if
  else
    return POSIX path of firstItem
  end if
  -- any and all returns should be sending output to the shell script's arguement

end run
