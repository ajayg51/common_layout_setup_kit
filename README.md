# Common Repo for utility files

#  for kotlin version issue during build check all packages supported version one by one

##   ( RED FLAG ) Always check ref ID of dependent repos

##  explicitly add import if auto import not working
```
  import 'package:common_layout_setup_kit/utils/common_scaffold.dart';
```

###  Paste below lines with latest commit ID of this repo in pubspec.yaml file of dependent flutter app at dependencies indentation level

```
#github repos
  common_layout_setup_kit:
    git:  
      url:  https://github.com/ajayg51/common_layout_setup_kit.git
      ref:  4ff0060  #  same as CLS Kit commit ID
```



```
  Contains boilerplate code for
  * screens like Splash Screen, Appbar
  * utlitiy methods like Extension methods for spacing and padding
```

