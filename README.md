# Katsuyou / 活用 (Conjugation)

## Usage

This gem generates conjugations for ichidan ("る") and godan ("う") verbs, as
well as the two notable exceptions in suru (する) and kuru (来る). Other verbs
exist (like [nidan
verbs](https://en.wiktionary.org/wiki/Category:Japanese_nidan_verbs)), but as
they're (apparently, I'm no expert) archaisms, I didn't bother implementing
them.

``` ruby
Katsuyou.conjugate("食べる", type: :ichidan_verb)
Katsuyou.conjugate("聞く", type: :godan_verb)

# Our special cases
Katsuyou.conjugate("する", type: :suru_verb)
Katsuyou.conjugate("勉強する", type: :suru_verb)
Katsuyou.conjugate("来る", type: :kuru_verb)
```

(By the way, if you're not sure what type of verb a given word is, consult a
[primer on verb
groups](https://www.tofugu.com/japanese-grammar/verb-conjugation-groups/) and a
[dictionary](https://jisho.org) to be sure)

And you'll get back a [Struct](https://ruby-doc.org/core-2.7.0/Struct.html)
subclass containing a number of conjugated forms:

```ruby
conjugations = Katsuyou.conjugate("見せる", type: :ichidan_verb)

#  #<struct Katsuyou::VerbConjugation
#   conjugation_type=
#    #<struct Katsuyou::ConjugationType
#     code="v1",
#     description="Ichidan verb",
#     category=:ichidan_verb,
#     supported=true>,
#   present="見せる",
#   present_polite="見せます",
#   present_negative="見せない",
#   present_negative_polite="見せません",
#   past="見せた",
#   past_polite="見せました",
#   past_negative="見せなかった",
#   past_negative_polite="見せませんでした",
#   conjunctive="見せて",
#   conjunctive_polite="見せまして",
#   conjunctive_negative="見せなくて",
#   conjunctive_negative_polite="見せませんで",
#   provisional="見せれば",
#   provisional_negative="見せなければ",
#   volitional="見せよう",
#   volitional_polite="見せましょう",
#   imperative="見せろ",
#   imperative_negative="見せるな",
#   potential="見せられる",
#   potential_polite="見せられます",
#   potential_negative="見せられない",
#   potential_negative_polite="見せられません",
#   passive="見せられる",
#   passive_polite="見せられます",
#   passive_negative="見せられない",
#   passive_negative_polite="見せられません",
#   causative="見せさせる",
#   causative_polite="見せさせます",
#   causative_negative="見せさせない",
#   causative_negative_polite="見せさせません",
#   causative_passive="見せさせられる",
#   causative_passive_polite="見せさせられます",
#   causative_passive_negative="見せさせられない",
#   causative_passive_negative_polite="見せさせられません">
```

## Installation

Stick this in your Gemfile and 吸う it:

```
gem "katsuyou"
```
