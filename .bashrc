
function _random_symbol() {
    local symbols=(
        '\U1F349'   # :watermelon:
        '\U1F34C'   # :banana:
        '\U1F34D'   # :pineapple:
        '\U1F95D'   # :kiwi_fruit:
        '\U1F965'   # :coconut:
        '\U1F951'   # :avocado:
        '\U1F968'   # :pretzel:
        '\U1F9C0'   # :cheese_wedge:
        '\U1F356'   # :meat_on_bone:
        '\U1F354'   # :hamburger:
        '\U1F32D'   # :hot_dog:
        '\U1F96A'   # :sandwich:
        '\U1F32E'   # :taco:
        '\U1F32F'   # :burrito:
        '\U1F959'   # :stuffed_flatbread:
        '\U1F9C6'   # :falafel:
        '\U1F958'   # :shallow pan of food:
        '\U1F372'   # :pot_of_food:
        '\U1F957'   # :green_salad:
        '\U1F371'   # :bento_box:
        '\U1F35B'   # :curry_rice:
        '\U1F35C'   # :steaming_bowl:
        '\U1F35D'   # :spaghetti:
        '\U1F362'   # :oden:
        '\U1F363'   # :sushi:
        '\U1F364'   # :fried_shrimp:
        '\U1F365'   # :fish_cake_with_swirl:
        '\U1F96E'   # :moon_cake:
        '\U1F95F'   # :dumpling:
        '\U1F4B4'   # :yen_banknote:
    )
    echo -en "${symbols[$(($RANDOM % ${#symbols[@]}))]}"
}

alias gp='git push origin $(git branch --show-current)'
alias gpf='git push origin $(git branch --show-current) --force-with-lease'
alias ev='ps aux | grep vim'

PS1="$(_random_symbol) "

export PATH=$PATH:$HOME/go/bin

