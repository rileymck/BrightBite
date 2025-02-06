# Team-Smile
Senior Experience Project


Directions for flutter, MacOS
1.Install Development Tools
  -Go to App store on your computer and download "Xcode"
  
  In terminal
    -type " sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch' "
    -agree to licence " sudo xcodebuild -license "
    -Install CocoaPods " sudo gem install cocoapods "
    -Add CocoaPods to your path " echo 'export PATH=$HOME/.gem/bin:$PATH' >> ~/.zshenv "
    then " source ~/.zshenv "

2.Install Flutter SDK
  Option A
  -Install Visual Studio Code, heres a link to follow " https://code.visualstudio.com/docs/setup/mac "

  In VScode
    -Under extentions tab type in " flutter " it should be the first one named " Flutter Dart Code "
    -Under Exploror tab press Command + Shift + P and type "Flutter: New Project" and follow directions to either locate or download the SDK

  Option B
  -Download the Flutter SDK from the Flutter website 
    " https://docs.flutter.dev/get-started/install?gad_source=1&gclid=CjwKCAiA2JG9BhAuEiwAH_zf3iNRZY06OMCu0aGtTYY2c7IK6Jaw-N5pR8KOojsgXKlumw0iWWfuBBoC_-cQAvD_BwE&gclsrc=aw.ds "

  In terminal
    - " cd " into Users then " mkdir development " then " cd development " then " mkdir flutter "
    -Update your path " echo 'export PATH="$PATH:`pwd`/flutter/bin"' >> ~/.zshenv " then " source ~/.zshenv "
    

3.Configure iOS Development
  In Terminal
    -Install the iOS simulator " xcodebuild -downloadPlatform iOS "
    -Launch iOS simulator " open -a Simulator "

4.Run Flutter Doctor
  In Terminal
    - " flutter doctor "
    check output for any issues to see if anythings missing
    
    
