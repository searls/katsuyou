# Katsuyou

## Usage

This gem generates conjugations for ichidan (る) and godan (う) verbs, as well
as the two notable exceptions in する and 来る. Other verbs exist (like [nidan
verbs](https://en.wiktionary.org/wiki/Category:Japanese_nidan_verbs)), but as
they're (apparently, I'm no expert) archaisms, I didn't bother implementing
them.

``` ruby
Katsuyou.conjugate("食べる", type: :ichidan_verb)
Katsuyou.conjugate("聞く", type: :godan_verb)

# Our special cases
Katsuyou.conjugate("する", type: :suru_verb)
Katsuyou.conjugate("来る", type: :kuru_verb)
```

And you'll get back a number of conjugated forms.

## Installation

Stick this in your Gemfile and 吸う it:

```
gem "katsuyou"
```
