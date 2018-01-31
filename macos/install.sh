# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

# Write some settings

# Drivers
## Disable Infrared Receiver
defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 0


# ==============================================
# Desktop Services
# ==============================================
# Metadata Files
# Disable Creation of .DS_Store and AppleDouble Files on Network Volumes
#defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable creation of .DS_Store and AppleDouble files on USB Volumes.
#defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad ActuateDetends -int 1
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHoizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -int 1
defaults write com.apple.AppleMultitouchTrackpad UserPreferences -bool true

# Dock
## Set minimize effect
defaults write com.apple.dock mineffect -string suck
# defaults write com.apple.dock mineffect -string scale
# defaults write com.apple.dock mineffect -string genie
defaults write com.apple.dock minimize-to-application -bool true
# Hot corners -> bottom left -> put display to sleep
defaults write com.apple.dock "wvous-bl-corner" -int 10
defaults write com.apple.dock "wvous-bl-modifier" -int 0
# Disable Auto Rearrange Spaces Based on Most Recent Use
defaults write com.apple.dock mru-spaces -bool false
killall Dock


# ==============================================
# Finder Preferences
# ==============================================

defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## New Finder windows show Home folder
defaults write com.apple.finder NewWindowTarget PfHm
# Show full path in title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Sort Folders First
defaults write com.apple.finder _FXSortFoldersFirst -bool YES

# Set sidebar size to small
defaults write -g NSTableViewDefaultSizeMode -int 1

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

## Desktop Icons
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
killall Finder


# ==============================================
# Mail
# ==============================================

# show mail attachments as icons:
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes

# ==============================================
# Contacts (Address Book)
# ==============================================

# Address format
defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string "ca"

# Sort by last name
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

# Display format "Last, First" (High Sierra)
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 2

# Prefer nicknames
defaults write NSGlobalDomain NSPersonNameDefaultShouldPreferNicknamesPreference -bool true

# ==============================================
# Calendar
# ==============================================

# Show 7 days
defaults write com.apple.iCal "n days of week" -int 7

# Week starts on monday
defaults write com.apple.iCal "first day of week" -int 1

# Day starts at 8am
defaults write com.apple.iCal "first minute of work hours" -int 420

# Day ends at 5pm
defaults write com.apple.iCal "last minute of work hours" -int 1020

# Show event times
defaults write com.apple.iCal "Show time in Month View" -bool true

# Show events in year view
defaults write com.apple.iCal "Show heat map in Year View" -bool true

# Show sidebar
defaults write com.apple.iCal CalendarSidebarShown -bool true


# ==============================================
# TextEdit
# ==============================================

# Set plaintext as default for TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Lock Screen
## Require password after screensaver
defaults write com.apple.screensaver askForPassword -int 1
## Ask for password after n seconds
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ==============================================
# Terminal
# ==============================================

# Set profile
defaults write com.apple.Terminal "Default Window Settings" -string 


# Reduce Transparency
#defaults write com.apple.universalaccess reduceTransparency -bool true


# Set natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# 24-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

# Use smooth scrolling
defaults write NSGlobalDomain AppleScrollAnimationEnabled -bool true

# No translucent menu bar
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false



# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install tmux
brew cask install calibre firefox nextcloud sublime-text textmate tunnelblick

mkdir $HOME/Development
