# HolyEvalExpr
HolyEvalExpr is a simple mathematical expression evaluator done in HolyC using hcc, it stands more as a joke than a practical project.

Some limitations were encountered when working with hcc such as the non-handling of enums.

HCC also makes recursive Makefiles and the compilation of all obj files in specific diretories tricky to implement, if you find a way to make it work, 
please feel free to make a pull request.

## Installation
### HCC
```sh
git clone git@github.com:Jamesbarford/holyc-lang.git
cd ./holyc-lang
sudo make install
```
### HolyEvalExpr
```sh
git clone https://github.com/wyattros/HolyEvalExpr.git
cd HolyEvalExpr && make
```

## Usage
```sh
cd build/
./holyEval 67+(67*67)/(6^7)
```

## More
See more about HolyC and/or HCC:

[The HolyC website](holyc-lang.com)

[The HCC github page](https://github.com/Jamesbarford/holyc-lang)
